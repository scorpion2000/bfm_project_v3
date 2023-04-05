while {true} do {
	sleep 10;
	_areaObjects = missionNamespace getVariable ["bfm_areas", []];
	{
		_mat = 0;
		_man = 0;

		_productionFocus = _x getVariable "productionFocus";
		_productionLevel = _x getVariable "productionLevel";

		switch (_productionFocus) do {
			case 0: {
				_mat = (ceil random 50) * _productionLevel;
				_man = (ceil random 10) * _productionLevel;
			};
			case 1: {
				_mat = (ceil random 10) * _productionLevel;
				_man = (ceil random 20) * _productionLevel;
			};
			case 2: {
				_mat = (ceil random 30) * _productionLevel;
				_man = (ceil random 15) * _productionLevel;
			};
			default {
				_mat = (ceil random 30) * _productionLevel;
				_man = (ceil random 15) * _productionLevel;
			};
		};

		//systemChat format ["Generated %1 materials and %2 manpower for %3", _mat, _man];
		_mat = _mat + (_x getVariable "storedMaterial");
		_man = _man + (_x getVariable "storedManpower");
		_x setVariable ["storedMaterial", _mat];
		_x setVariable ["storedManpower", _man];
			
	} forEach _areaObjects;
	[] remoteExec ["bfm_fnc_saveAreas", 2, false];
};
