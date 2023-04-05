params ["_player"];

systemChat "Loading Player Stats";

_playerDBid = ["BFM_Players\player",getPlayerUID _player] joinString "_";
_inidbi = ["new", _playerDBid] call OO_INIDBI;

if ("exists" call _inidbi) then {
	_name = 			["read", ["general", "type"]] call _inidbi;
	_positionATL = 		["read", ["general", "positionATL"]] call _inidbi;
	_direction = 		["read", ["general", "direction"]] call _inidbi;
	_stance = 			["read", ["general", "stance"]] call _inidbi;
	_aceFatigue = 		["read", ["general", "aceFatigue"]] call _inidbi;
	_aceRations = 		["read", ["general", "aceRations"]] call _inidbi;
	_hitPointDamage = 	["read", ["general", "hitPointDamage"]] call _inidbi;
	_aceMedical = 		["read", ["general", "aceMedical"]] call _inidbi;
	_katMedical = 		["read", ["general", "katMedical"]] call _inidbi;
	_vehicle = 			["read", ["general", "vehicle"]] call _inidbi;
	_loadout = 			["read", ["general", "loadout"]] call _inidbi;
	_isAlive = 			["read", ["general", "isAlive"]] call _inidbi;
	_aceMedicalLogs = 	["read", ["general", "aceMedicalLogs"]] call _inidbi;

	if (_isAlive) then {
		switch (_stance) do {
			case "STAND": { _player switchAction "PlayerStand" };
			case "CROUCH": { _player switchAction "PlayerCrouch" };
			case "PRONE": { _player switchAction "PlayerProne" };
			default { diag_log format ["Error loading stance for [ %1 ]", _player] };
		};

		//I honestly forgot why I'm checking the typeName
		//Seems stupid
		//It might be because I didn't use ACE default values before	~Hullahopp
		/*if (typeName ((_result select 3) select 0) != "STRING") then {_player setVariable ["ace_advanced_fatigue_anreserve", ((_result select 3) select 0), true]};
		if (typeName ((_result select 3) select 1) != "STRING") then {_player setVariable ["ace_advanced_fatigue_muscledamage", ((_result select 3) select 1), true]};
		if (typeName ((_result select 3) select 2) != "STRING") then {_player setVariable ["ace_advanced_fatigue_anfatigue", ((_result select 3) select 2), true]};
		if (typeName ((_result select 3) select 3) != "STRING") then {_player setVariable ["ace_advanced_fatigue_aimfatigue", ((_result select 3) select 3), true]};
		if (typeName ((_result select 3) select 4) != "STRING") then {_player setVariable ["ace_advanced_fatigue_animhandler", ((_result select 3) select 4), true]};
		if (typeName ((_result select 3) select 5) != "STRING") then {_player setVariable ["ace_advanced_fatigue_ae2reserve", ((_result select 3) select 5), true]};
		if (typeName ((_result select 3) select 6) != "STRING") then {_player setVariable ["ace_advanced_fatigue_ae1reserve", ((_result select 3) select 6), true]};*/
		_player setVariable ["ace_advanced_fatigue_anreserve", (_aceFatigue select 0), true];
		_player setVariable ["ace_advanced_fatigue_muscledamage", (_aceFatigue select 1), true];
		_player setVariable ["ace_advanced_fatigue_anfatigue", (_aceFatigue select 2), true];
		_player setVariable ["ace_advanced_fatigue_aimfatigue", (_aceFatigue select 3), true];
		_player setVariable ["ace_advanced_fatigue_animhandler", (_aceFatigue select 4), true];
		_player setVariable ["ace_advanced_fatigue_ae2reserve", (_aceFatigue select 5), true];
		_player setVariable ["ace_advanced_fatigue_ae1reserve", (_aceFatigue select 6), true];

		_player setVariable ["acex_field_rations_consumableactionscache", (_aceRations select 0), true];
		_player setVariable ["acex_field_rations_hunger", (_aceRations select 1), true];
		_player setVariable ["acex_field_rations_thirst", (_aceRations select 2), true];

		{
			_player setHitPointDamage [_x, ((_hitPointDamage select 2) select _forEachIndex)];
		} forEach (_hitPointDamage select 0);

		{
			_player setVariable [(_x select 0), (_x select 1), (_x select 2)];
			
			if ((_x select 0) == "ACE_isUnconscious") then {
				systemChat format ["%1, %2", _player, (_x select 1)];
				[_player, (_x select 1)] call ace_medical_status_fnc_setUnconsciousState;
			};

			if ((_x select 0) == "ace_medical_pain") then {
				[_player, (_x select 1)] call ace_medical_status_fnc_adjustPainLevel;
			};
		} forEach _aceMedical;

		{
			//systemChat format ["%1, %2", (_x select 0), (_x select 1)];
			_player setVariable [(_x select 0), (_x select 1), (_x select 2)];
		} forEach _katMedical;

		{
			_player setVariable _x;
		} forEach _aceMedicalLogs;

		_player setUnitLoadout (_loadout);
		[true, name _player] remoteExec ["bfm_fnc_welcomeMessage", _player, false];

		if (_vehicle != "-1") then {
			_vehicle = missionNamespace getVariable format ["vehicle_%1", _vehicle];
			_try = -1;
			_inVehicle = false;
			while {!(_inVehicle)} do {
				_try = _try + 1;
				_inVehicle = _player in _vehicle;
				switch (_try) do {
					case 0: {_player moveInCargo _vehicle};
					case 1: {_player moveInGunner _vehicle};
					case 2: {_player moveInCommander _vehicle};
					case 3: {_player moveInDriver _vehicle};
					default { _inVehicle = true; _player setPosATL (getPosATL _vehicle);};	//In case the vehicle is full
				};
			};
		} else {
			_player setPosATL _positionATL;
			_player setDir _direction;
		};
	} else {
		[_player] remoteExec ["bfm_fnc_savePlayerStats", 2, false];
		[false, name _player] remoteExec ["bfm_fnc_welcomeMessage", _player, false];
		_player setPos getPos bluforBaseSpawnPoint vectorAdd [random [-3, 0, 3], random [-3, 0, 3], 0];
		_player setDir (random 360);
	}
} else {
	[_player] remoteExec ["bfm_fnc_savePlayerStats", 2, false];
	[false, name _player] remoteExec ["bfm_fnc_welcomeMessage", _player, false];
	_player setPos getPos bluforBaseSpawnPoint vectorAdd [random [-3, 0, 3], random [-3, 0, 3], 0];
	_player setDir (random 360);
}
