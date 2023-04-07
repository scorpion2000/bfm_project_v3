_highestScore = 0;
_highestArea = objNull;

_areaObjects = missionNamespace getVariable ["bfm_areas", []];
{
	_score = _x getVariable "score";
	_name = _x getVariable "sectionName";
	if (_score > _highestScore) then {
		_highestArea = _x;
		_highestScore = _score;
	};
} forEach _areaObjects;

_highestArea setVariable ["isCapital", true];
missionnamespace setVariable ["area_capital", _highestArea];

[] remoteExec ["bfm_fnc_saveAreas", 2, false];