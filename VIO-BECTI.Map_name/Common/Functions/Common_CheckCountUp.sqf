/*
  # HEADER #
	Script: 		Common\Functions\Common_GetTechmatrix.sqf
	Alias:			CTI_CO_FNC_GetTechmatrix
	Description:	Checks if the level counter needs to count up once ore more to match with the complete tech tree
	Author: 		dukee
	Creation Date:	10-01-2022
	Revision Date:	10-01-2022
	
  # PARAMETERS #
    0	[Side]: The initial counter
    1	[Array]: The Full Tech matrix
    2	[Array]: The Nation (+ mod) matrix
	
  # RETURNED VALUE #
	[Integer]: the new counter value
	
  # SYNTAX #
	[SIDE, UPGRADE, UPGRADE LEVEL] call CTI_CO_FNC_HasUpgrade
	[COUNTER, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
	
  # EXAMPLE #
    _tech_level = [_matrix_cnt + 1, _matrix_full, _matrix_nation] call CTI_CO_FNC_CheckCountUp;
*/

private ["_counter", "_counter_last", "_matrix_full", "_matrix_nation", "_i", "_found"];

_counter_last = _this select 0;
if(isNil "_counter") then {_counter = -1};
_matrix_full = _this select 1;
_matrix_nation = _this select 2;
_counter = 0;
_found = false;

for [{_i = 0}, {_i < count _matrix_full}, {_i = _i + 1}] do {
	if(_counter < count _matrix_full) then {		
		if((_matrix_full select _i) == (_matrix_nation select _i)) then {
			if(_matrix_full select _i == true) then {
				if(_found) then {_counter = _counter + 1;};
				_found = true;
			};
		} else {
			if((_matrix_nation select _i) == false) then {
				_counter = _counter + 1;
			} else {
				_found = true;
			};
		};
		if(_found) then {
			if(_counter >= _counter_last) then {
				_i = count _matrix_full;
			};
		};
	} else {
		_i = count _matrix_full;
		_counter = -1;
	};
};

if (CTI_Log_Level >= CTI_Log_Debug) then {["VIOC_DEBUG", "FILE: common\functions\Common_CheckCountUp.sqf", format["Counter: [%1] Matrix: <%2> <%3>", _counter, _matrix_full, _matrix_nation]] call CTI_CO_FNC_Log;};

_counter
