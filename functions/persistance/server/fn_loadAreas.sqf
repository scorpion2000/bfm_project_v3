_inidbi = ["new", "BFM_OpforDetails"] call OO_INIDBI;

_activeAreas = [];

if ("exists" call _inidbi) then {
	_areasArray = [];
	_sectionsArray = "getSections" call _inidbi;
	{
		_areaObject = createVehicle ["VR_3DSelector_01_default_F", [0,0,0], [], 0, "CAN_COLLIDE"];
		_areaObject setPosASL [0,0,(_foreachIndex * 5)];
		_section = _x;
		_keysArray = ["getKeys", _section] call _inidbi;
		{
			_keyValue = ["read", [_section, _x]] call _inidbi;
			_areaObject setVariable [_x, _keyValue];
			if (_x == "isCapital" && str _keyValue == "true") then { missionnamespace setVariable ["area_capital", _areaObject]; };
			if (_x == "isActive" && str _keyValue == "true") then { _activeAreas pushBack _areaObject; };
		} forEach _keysArray;

		_areasArray pushBack _areaObject;
		/*missionNamespace setVariable [_x, _result];
		if (_result select 14) then {
			missionNamespace setVariable ["areaCapital", _x];
		};*/
	} forEach _sectionsArray;
	missionNamespace setVariable ["bfm_areas", _areasArray, true];
} else {
	[] execVM "scripts\gatherAreas.sqf";
};
missionNamespace setVariable ["loadingAreas", false];

{
	[_x] remoteExec ["bfm_fnc_activateArea", 2, false];
} forEach _activeAreas;