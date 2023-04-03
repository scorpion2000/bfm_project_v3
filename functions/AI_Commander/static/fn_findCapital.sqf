_inidbi = ["new", "BFM_OpforDetails"] call OO_INIDBI;

//13
_highestScore = 0;
_highestArea = "-";

/*if ("exists" call _inidbi) then {
	_keysArray = ["getKeys", "Areas"] call _inidbi;
	{
		_keyIndex = _x;
		_key = ["read", ["Areas", _keyIndex]] call _inidbi;
		if (_key#0 > _highestScore) then {
			_highestArea = _x;
			_highestScore = _key#0;
		}
	} forEach _keysArray;
	_key = ["read", ["Areas", _highestArea]] call _inidbi;
	_key set [14, true];
	["write", ["Areas", _highestArea, _key]] call _inidbi;
} else {
	[] execVM "scripts\gatherAreas.sqf";
};*/

_areaCount = missionNamespace getVariable "areaCount";
for "_i" from 0 to (_areaCount -1) do {
	_areaName = format ["area_%1", _i];
	_key = missionNamespace getVariable _areaName;

	if (_key#0 > _highestScore) then {
		_highestArea = _areaName;
		_highestScore = _key#0;
	};
	_key = missionNamespace getVariable _highestArea;
	_key set [14, true];
	missionNamespace setVariable [_highestArea, _key];
};

[] remoteExec ["bfm_fnc_saveAreas", 2, false];