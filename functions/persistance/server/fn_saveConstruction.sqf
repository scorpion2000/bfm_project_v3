params ["_object"];
if (!isNil "_object") then {
	_inidbi = ["new", "BFM_WorldDetails"] call OO_INIDBI;
	[
		"write",
		[
			"constructions", 
			CONST_INDEX, 
			[ 
				typeOf _object,
				getpos _object, 
				getDir _object
			]
		]
	] call _inidbi;

	CONST_INDEX = CONST_INDEX +1;
};

_inidbi = ["new", "BFM_BlueforDetails"] call OO_INIDBI;
[
	"write",
	[
		"construction", 
		"idex", 
		CONST_INDEX
	]
] call _inidbi;

_inidbi = ["new", "BFM_BlueforDetails"] call OO_INIDBI;
[
	"write",
	[
		"construction", 
		"budget", 
		[west] call acex_fortify_fnc_getBudget
	]
] call _inidbi;