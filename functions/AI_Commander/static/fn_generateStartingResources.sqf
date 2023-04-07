_areaObjects = missionNamespace getVariable ["bfm_areas", []];
{
	_score = _x getVariable "score";
	_material = ceil (_score /2);
	_x setVariable ["storedMaterial", _material];
	_manpower = ceil (_score /20);
	_x setVariable ["storedManpower", _manpower];
	_multiPurpuseSoldier = ceil (_score /10);
	_x setVariable ["multiPurpuseSoldier", _multiPurpuseSoldier];
	_tank = 0;
	if (_score > 600) then {_tank = 1;};
	_x setVariable ["tank", _tank];

	_APC = 0;
	if (_score > 500) then {_APC = 1;};
	_x setVariable ["apc", _APC];

	_armedVehicle = 0;
	if (_score > 400) then {_armedVehicle = 2;};
	_x setVariable ["armedVehicle", _armedVehicle];

	_AAgun = 0;
	if (_score > 600) then {_AAgun = 2;};
	_x setVariable ["aaGun", _AAgun];

	_ATgun = 0;
	if (_score > 400) then {_ATgun = 2;};
	_x setVariable ["atGun", _ATgun];

	_staticGun = 2;
	if (_score > 300) then {_staticGun = 5;};
	_x setVariable ["staticGun", _staticGun];

	_transportVehicle = 2;
	if (_score > 200) then {_transportVehicle = 4;};
	_x setVariable ["transportVehicle", _transportVehicle];

	if !(_x getVariable "isCapital") then {
		_x setVariable ["productionFocus", selectRandom [0, 1, 2]];
	} else {
		_x setVariable ["productionLevel", 2];
	};
} foreach _areaObjects;

[] remoteExec ["bfm_fnc_saveAreas", 2, false];