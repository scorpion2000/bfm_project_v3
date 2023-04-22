_areaObjects = missionNamespace getVariable ["bfm_areas", []];
{
	_mat = 0;
	_man = 0;

	_productionFocus = _x getVariable "productionFocus";
	_productionLevel = _x getVariable "productionLevel";

	//Production focus gives a bit extra resource on it's focus, while gives less on others
	//Might get rid of it later, it actually throws off price calculations and makes the game insanely unbalanced
	switch (_productionFocus) do {
		/*//Material Focus
		case 0: {
			_mat = (12.5 + 2.5) * _productionLevel;
			_man = (5 - 2.5) * _productionLevel;
		};
		//Manpower Focus
		case 1: {
			_mat = (12.5 - 2.5) * _productionLevel;
			_man = (5 + 2.5) * _productionLevel;
		};*/
		//Balanced (Default)
		case 2: {
			_mat = 12.5 * _productionLevel;
			_man = 5 * _productionLevel;
		};
		//Default value (in case Focus isn't set/wrongly set up)
		default {
			_mat = 12.5 * _productionLevel;
			_man = 5 * _productionLevel;
		};
	};

	//systemChat format ["Generated %1 materials and %2 manpower for %3", _mat, _man];
	_mat = _mat + (_x getVariable "storedMaterial");
	_man = _man + (_x getVariable "storedManpower");
	_x setVariable ["storedMaterial", _mat];
	_x setVariable ["storedManpower", _man];
		
} forEach _areaObjects;
[] remoteExec ["bfm_fnc_saveAreas", 2, false];
