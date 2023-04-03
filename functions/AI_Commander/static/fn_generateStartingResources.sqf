_areaCount = missionNamespace getVariable "areaCount";
for "_i" from 0 to (_areaCount -1) do {
	_areaName = format ["area_%1", _i];
	_key = missionNamespace getVariable _areaName;

	_score = _key#0;
	_material = ceil (_score /2);
	_manpower = ceil (_score /20);
	_multiPurpuseSoldier = ceil (_score /10);
	_tank = 0;
	if (_score > 600) then {
		_tank = 1;
	};
	_APC = 0;
	if (_score > 500) then {
		_APC = 1;
	};
	_armedVehicle = 0;
	if (_score > 400) then {
		_armedVehicle = 2;
	};
	_AAgun = 0;
	if (_score > 600) then {
		_AAgun = 2;
	};
	_ATgun = 1;
	if (_score > 400) then {
		_ATgun = 3;
	};
	_staticGun = 2;
	if (_score > 300) then {
		_staticGun = 5;
	};
	_transportVehicle = 2;
	if (_score > 200) then {
		_transportVehicle = 4;
	};
	_unitArray = [
		_multiPurpuseSoldier,
		_tank,
		_APC,
		_armedVehicle,
		_AAgun,
		_ATgun,
		_staticGun,
		_transportVehicle
	];
	_key set [12, _material];
	_key set [13, _manpower];
	_key set [7, _unitArray];

	if !(_key#14) then {
		_key set [8, selectRandom [0, 1, 2]];
	} else {
		_key set [9, 2];
	};

	missionNamespace setVariable [_areaName, _key];
	
};

[] remoteExec ["bfm_fnc_saveAreas", 2, false];