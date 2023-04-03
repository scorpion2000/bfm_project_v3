player addEventHandler ["GetInMan", {
	//params ["_unit", "_role", "_vehicle", "_turret"];
	_weight = (loadAbs (_this select 0) * 0.45359237) / 10;
	if ((_this select 2) isKindOf "Plane") then {
		if (_weight > 10) then {
			titleText ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>Your weight must not exceed 10kg!</t>", "PLAIN DOWN", 2, false, true];
			moveOut (_this select 0);
			titleFadeOut 6;
		}
	};
	if ((_this select 2) isKindOf "Helicopter") then {
		if (_weight > 12 && ((_this select 1) == "driver" || (_this select 1) == "gunner")) then {
			titleText ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>Your weight must not exceed 12kg!</t>", "PLAIN DOWN", 2, false, true];
			moveOut (_this select 0);
			titleFadeOut 6;
		}
	};
	if ((_this select 2) isKindOf "Tank") then {
		if (_weight > 14 && ((_this select 1) == "driver" || (_this select 1) == "gunner" || (_this select 1) == "commander")) then {
			titleText ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>Your weight must not exceed 14kg!</t>", "PLAIN DOWN", 2, false, true];
			moveOut (_this select 0);
			titleFadeOut 6;
		}
	};
	if ((_this select 2) isKindOf "WheeledAPC") then {
		if (_weight > 14 && ((_this select 1) == "driver" || (_this select 1) == "gunner" || (_this select 1) == "commander")) then {
			titleText ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>Your weight must not exceed 14kg!</t>", "PLAIN DOWN", 2, false, true];
			moveOut (_this select 0);
			titleFadeOut 6;
		}
	};
	//systemChat str _weight;
	//systemChat str (_this select 1);
	//systemChat str ((_this select 2) call BIS_fnc_objectType);
}];