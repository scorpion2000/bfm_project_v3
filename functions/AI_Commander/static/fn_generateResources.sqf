while {true} do {
	_areaCount = missionNamespace getVariable "areaCount";
	for "_i" from 0 to (_areaCount -1) do {
		_areaName = format ["area_%1", _i];
		_key = missionNamespace getVariable _areaName;
		_mat = 0;
		_man = 0;

		switch (_key#8) do {
			case 0: {
				_mat = (ceil random 50) * _key#9;
				_man = (ceil random 10) * _key#9;
			};
			case 1: {
				_mat = (ceil random 10) * _key#9;
				_man = (ceil random 20) * _key#9;
			};
			case 2: {
				_mat = (ceil random 30) * _key#9;
				_man = (ceil random 15) * _key#9;
			};
			default {
				_mat = (ceil random 30) * _key#9;
				_man = (ceil random 15) * _key#9;
			};
		};

		//systemChat format ["Generated %1 materials and %2 manpower for %3", _mat, _man, _areaName];

		_key set [12, (_key#12 + _mat)];
		_key set [13, (_key#13 + _man)];
		missionNamespace setVariable [_areaName, _key];
	};
	[] remoteExec ["bfm_fnc_saveAreas", 2, false];
	sleep 600;
};
