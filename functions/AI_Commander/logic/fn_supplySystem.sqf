_areaObjects = missionNamespace getVariable ["bfm_areas", []];
{
	_storedMaterial = _x getVariable "storedMaterial";
	_minimumMaterial = _x getVariable "minMat";
	_underAttack = _x getVariable "underAttack";
	_isCapital = _x getVariable "isCapital";

	if (_storedMaterial > _minimumMaterial && !_underAttack && !_isCapital) then {
		_toSupply = _storedMaterial - _minimumMaterial;
		if (_toSupply > 50) then {
			//[_areaName, missionNamespace getVariable "areaCapital", "mat", _toSupply, "", "", -1, ""] remoteExec ["bfm_fnc_createSupplyRun", 2, false];
		};
	};
} forEach _areaObjects;