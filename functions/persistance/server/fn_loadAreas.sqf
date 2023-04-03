_inidbi = ["new", "BFM_OpforDetails"] call OO_INIDBI;

if ("exists" call _inidbi) then {
	_keysArray = ["getKeys", "Areas"] call _inidbi;
	{
		_result = (["read", ["Areas", _x]] call _inidbi);
		missionNamespace setVariable [_x, _result];
		if (_result select 14) then {
			missionNamespace setVariable ["areaCapital", _x];
		};
	} forEach _keysArray;
	missionNamespace setVariable ["areaCount", count _keysArray];
	[] remoteExec ["bfm_fnc_generateResources", 2, false];
} else {
	[] execVM "scripts\gatherAreas.sqf";
};
missionNamespace setVariable ["loadingAreas", false];