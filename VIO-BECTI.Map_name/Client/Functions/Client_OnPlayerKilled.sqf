/*
  # HEADER #
	Script: 		Client\Functions\Client_OnPlayerKilled.sqf
	Alias:			CTI_CL_FNC_OnPlayerKilled
	Description:	Triggered from the "Killed" EH whenever the player dies
					Note this function shall be called by an Event Handler (EH) but can be called manually
	Author: 		Benny
	Creation Date:	19-09-2013
	Revision Date:	19-09-2013
	
  # PARAMETERS #
    0	[Object]: The killed unit
    1	[Object]: The killer
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	[KILLED, KILLER] spawn CTI_CL_FNC_OnPlayerKilled
	
  # DEPENDENCIES #
	Client Function: CTI_CL_FNC_AddMissionActions
	Common Function: CTI_CO_FNC_OnUnitKilled
	
  # EXAMPLE #
	player addEventHandler ["killed", {_this spawn CTI_CL_FNC_OnPlayerKilled}];
	  -> This function be triggered everytime the player dies
*/

private ["_killed", "_killer"];

_killed = _this select 0;
_killer = _this select 1;

CTI_DeathPosition = getPos _killed;

if(CTI_RESPAWN_PENALTY == -1) then {
	missionNamespace setVariable ["cti_gear_ondeath", (_killed) call CTI_UI_Gear_GetUnitEquipment];	//get the current gear for respawning if set
};

if !(isNil "CTI_DeathCamera") then {
	CTI_DeathCamera cameraEffect ["TERMINATE", "BACK"];
	camDestroy CTI_DeathCamera;
};

//--- Close dialogs if needed (check 2 times).
if (dialog) then {closeDialog 0};
if (dialog) then {closeDialog 0};

CTI_P_Respawning = true;

//--- Clear the previous
for '_i' from 0 to 15 do { player removeAction _i };

titleCut["","BLACK OUT",1];

if !(CTI_P_Jailed) then {[_killed, _killer, CTI_P_SideID] spawn CTI_CO_FNC_OnUnitKilled};

waitUntil {alive player};

if (CTI_P_Jailed) exitWith {
	_pos = getMarkerPos "prison";
	_rpos = [(_pos select 0) + random 2 - random 2, (_pos select 1) + random 2 - random 2, 0.75];
	player setPos _rpos;
	titleCut["","BLACK IN",1];
	
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeAllContainers player;
};

CTI_DeathTimer = time + (missionNamespace getVariable "CTI_RESPAWN_TIMER");

call CTI_CL_FNC_AddMissionActions;
call CTI_SK_FNC_Apply;

//--- Make sure that player is always the leader (of his group).
if (leader(group player) != player) then {(group player) selectLeader player};

createDialog "CTI_RscRespawnMenu";

titleCut["","BLACK IN",1];

CTI_DeathCamera = "camera" camCreate CTI_DeathPosition;
// CTI_DeathCamera camSetDir 0;
CTI_DeathCamera camSetFov 0.7;
CTI_DeathCamera cameraEffect["Internal","TOP"];

CTI_DeathCamera camSetTarget CTI_DeathPosition;
CTI_DeathCamera camSetRelPos [0,1,3];
CTI_DeathCamera camCommit 0;

waitUntil {camCommitted CTI_DeathCamera};

CTI_DeathCamera camSetRelPos [1,1,20];
CTI_DeathCamera camCommit (missionNamespace getVariable "CTI_RESPAWN_TIMER")+2;