_areaCount = missionNamespace getVariable "areaCount";
for "_i" from 0 to (_areaCount -1) do {
	_areaName = format ["area_%1", _i];
	_key = missionNamespace getVariable _areaName;

	_storedMaterial = (_key#12);
	_minimumMaterial = (_key#10);
	_underAttack = (_key#5);
	_isCapital = (_key#14);

	if (_storedMaterial > _minimumMaterial && !_underAttack && !_isCapital) then {
		_toSupply = _storedMaterial - _minimumMaterial;
		if (_toSupply > 50) then {
			//[_areaName, missionNamespace getVariable "areaCapital", "mat", _toSupply, "", "", -1, ""] remoteExec ["bfm_fnc_createSupplyRun", 2, false];
		};
	};
};