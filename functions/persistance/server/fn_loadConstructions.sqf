_inidbi = ["new", "BFM_WorldDetails"] call OO_INIDBI;
_inidbi2 = ["new", "BFM_BlueforDetails"] call OO_INIDBI;
_keysArray = ["getKeys", "constructions"] call _inidbi;

if ("exists" call _inidbi2) then {
	_budget = ["read", ["construction", "budget", 500]] call _inidbi2;
	CONST_INDEX = ["read", ["construction", "index", 0]] call _inidbi2;
	if (_budget != -2) then {
		[
			west, 
			_budget, 
			[
				["Land_BagFence_Long_F", 5], 
				["Land_HBarrierWall_corridor_F", 20],
				["Land_HBarrierWall6_F", 20],
				["Land_HBarrierWall4_F", 20],
				["Land_HBarrierTower_F", 25]
			]
		] call acex_fortify_fnc_registerObjects;
	}
}  else {
	CONST_INDEX = 0;
	[
		west, 
		500, 
		[
			["Land_BagFence_Long_F", 5], 
			["Land_HBarrierWall_corridor_F", 20],
			["Land_HBarrierWall6_F", 20],
			["Land_HBarrierWall4_F", 20],
			["Land_HBarrierTower_F", 25]
		]
	] call acex_fortify_fnc_registerObjects;
};

if ("exists" call _inidbi) then {
	if (!isNil "_keysArray") then {
		{
			_keyIndex = _x;
			_key = ["read", ["constructions", _keyIndex]] call _inidbi;
			_building = createVehicle [_key#0, _key#1, [], 0, "CAN_COLLIDE"];
			_building setDir _key#2;
			sleep 0.2;
		} forEach _keysArray;
	}
};
missionNamespace setVariable ["loadingConstructions", false];