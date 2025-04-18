private ["_tech_matrix"];

//techtree: 
//https://docs.google.com/spreadsheets/d/1HN6bopGMsHu7rxPnNN9V3aLaOEFsaQNu4yYJAimcTs0/edit?usp=sharing

_tech_matrix = 
[
	//CTI_UPGRADE_BARRACKS
	[
		//GER
		[
			//IFA
			[true,true,true],
			//SPE
			[true,true,true]
		],
		//SOV
		[
			//IFA
			[true,true,true],
			//SPE
			[false,false,false]
		],
		//UK
		[
			//IFA
			[true,true,true],
			//SPE
			[false,false,false]
		],
		//US
		[
			//IFA
			[true,true,true],
			//SPE
			[true,true,true]
		],
		//FR
		[
			//IFA
			[false,false,false],
			//SPE
			[true,true,true]
		]
	],
	//CTI_UPGRADE_LIGHT
	[
		//GER
		[
			//IFA
			[true,true,true,true,true,true],
			//SPE
			[true,true,true,false,false,false]
		],
		//SOV
		[
			//IFA
			[true,true,true,true,true,false],
			//SPE
			[false,false,false,false,false,false]
		],
		//UK
		[
			//IFA
			[true,true,true,true,false,false],
			//SPE
			[false,false,false,false,false,false]
		],
		//US
		[
			//IFA
			[true,true,true,true,true,false],
			//SPE
			[true,true,true,true,false,false]
		],
		//FR
		[
			//IFA
			[false,false,false,false,false,false],
			//SPE
			[true,true,true,true,false,false]
		]
	],
	//CTI_UPGRADE_HEAVY
	[
		//GER
		[
			//IFA
			[false,false,false,true,true,true,true,true,true],
			//SPE
			[false,false,true,true,true,true,false,true,false]
		],
		//SOV
		[
			//IFA
			[false,false,false,true,true,true,true,true,false],
			//SPE
			[false,false,false,false,false,false,false,false,false]
		],
		//UK
		[
			//IFA
			[true,false,false,true,false,true,true,true,false],
			//SPE
			[false,false,false,false,false,false,false,false,false]
		],
		//US
		[
			//IFA
			[false,true,true,false,false,true,true,true,false],
			//SPE
			[false,false,true,true,true,true,false,true,false]
		],
		//FR
		[
			//IFA
			[false,false,false,false,false,false,false,false,false],
			//SPE
			[false,false,true,true,true,true,false,true,false]
		]
	],
	//CTI_UPGRADE_AIR
	[
		//GER
		[
			//IFA
			[false,true,false,true,false,false],
			//SPE
			[false,false,false,true,false,false]
		],
		//SOV
		[
			//IFA
			[true,true,true,false,false,false],
			//SPE
			[false,false,false,false,false,false]
		],
		//UK
		[
			//IFA
			[true,false,true,false,false,false],
			//SPE
			[false,false,false,false,false,false]
		],
		//US
		[
			//IFA
			[true,true,false,true,false,false],
			//SPE
			[false,false,false,true,false,false]
		],
		//FR
		[
			//IFA
			[false,false,false,false,false,false],
			//SPE
			[false,false,false,false,false,false]
		]
	],
	//CTI_UPGRADE_NAVAL
	[
		//GER
		[
			//IFA
			[true,true,false,false],
			//SPE
			[false,false,false,false]
		],
		//SOV
		[
			//IFA
			[true,true,false,false],
			//SPE
			[false,false,false,false]
		],
		//UK
		[
			//IFA
			[true,true,false,false],
			//SPE
			[true,false,false,false]
		],
		//US
		[
			//IFA
			[true,true,false,false],
			//SPE
			[true,true,false,false]
		],
		//FR
		[
			//IFA
			[true,true,false,false],
			//SPE
			[false,false,false,false]
		]
	],
	[],[],[],[],[],[],[],
	//CTI_UPGRADE_GEAR
	[
		//GER
		[
			//IFA
			[true,true,true],
			//SPE
			[true,true,true]
		],
		//SOV
		[
			//IFA
			[true,true,true],
			//SPE
			[true,true,true]
		],
		//UK
		[
			//IFA
			[true,true,true],
			//SPE
			[true,true,true]
		],
		//US
		[
			//IFA
			[true,true,true],
			//SPE
			[true,true,true]
		],
		//FR
		[
			//IFA
			[true,true,true],
			//SPE
			[true,true,true]
		]
	]
];

missionNamespace setVariable ["CTI_TECHMATRIX", _tech_matrix];
if (CTI_Log_Level >= CTI_Log_Information) then { ["INFORMATION", "FILE: Common\Config\Units\Techmatrx.sqf", format ["Techmatrix are defined <%1|%2|%3>", count (_tech_matrix select 0), count (_tech_matrix select 0 select 0), count (_tech_matrix select 0 select 0 select 0)]] call CTI_CO_FNC_Log };