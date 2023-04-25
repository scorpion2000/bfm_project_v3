_isSafe = false;
_markerPos = [0,0,0];
_randomPosMapNoWater = [0,0,0];
while {!_isSafe} do {
	_randomPosMapNoWater = [] call BIS_fnc_randomPos;
	_isSafe = true;
	{
		_markerName = _x getVariable "markerName";
		_markerPos = markerPos _markerName;

		if (_randomPosMapNoWater distance2D _markerPos < 800) then { _isSafe = false; break; };
	} forEach (missionNamespace getVariable "bfm_areas");
	//_randomPosMapNoWater = [_randomPosMapNoWater, 0, 200, 0, 0, 0.1, 0] call BIS_fnc_findSafePos;
	_randomPosMapNoWater = _randomPosMapNoWater isFlatEmpty [-1, -1, 0.1, 100, 0, false];
	if (_randomPosMapNoWater isEqualTo []) then { _isSafe = false; };
};

if !(_randomPosMapNoWater isEqualTo []) then {
	"debug_location" setMarkerPos _randomPosMapNoWater;
};

_randomPosMapNoWater;