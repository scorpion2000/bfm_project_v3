_inidbi = ["new", "BFM_OpforDetails"] call OO_INIDBI;

_areaCount = missionNamespace getVariable "areaCount";

for "_i" from 0 to (_areaCount -1) do {
	_areaName = format ["area_%1", _i];
	_areaArray = missionNamespace getVariable _areaName;

	["write", ["Areas", _areaName, _areaArray]] call _inidbi;
}