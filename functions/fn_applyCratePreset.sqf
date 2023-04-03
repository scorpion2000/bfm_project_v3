params ["_selection", "_crate"];

switch (_selection) do {
	case "ammo": {
		{
			_crate addMagazineCargoGlobal [_x, 1];
		} forEach (blu_crate_ammo select 0);

		{
			_crate addItemCargoGlobal [_x, (((blu_crate_ammo select 1) select 1) select _forEachIndex)];
		} forEach ((blu_crate_ammo select 1) select 0);

		{
			_crate addWeaponCargoGlobal [_x, 1];
		} forEach (blu_crate_ammo select 2);
		
		{
			_crate addBackpackCargoGlobal [_x, (((blu_crate_ammo select 3) select 1) select _forEachIndex)];
		} forEach ((blu_crate_ammo select 3) select 0);
	};
	case "basicWeapons": {
		{
			_crate addMagazineCargoGlobal [_x, 1];
		} forEach (blu_crate_basicWeapons select 0);

		{
			_crate addItemCargoGlobal [_x, (((blu_crate_basicWeapons select 1) select 1) select _forEachIndex)];
		} forEach ((blu_crate_basicWeapons select 1) select 0);

		{
			_crate addWeaponCargoGlobal [_x, 1];
		} forEach (blu_crate_basicWeapons select 2);
		
		{
			_crate addBackpackCargoGlobal [_x, (((blu_crate_basicWeapons select 3) select 1) select _forEachIndex)];
		} forEach ((blu_crate_basicWeapons select 3) select 0);
	};
	case "specialWeapons": {
		{
			_crate addMagazineCargoGlobal [_x, 1];
		} forEach (blu_crate_specialWeapons select 0);

		{
			_crate addItemCargoGlobal [_x, (((blu_crate_specialWeapons select 1) select 1) select _forEachIndex)];
		} forEach ((blu_crate_specialWeapons select 1) select 0);

		{
			_crate addWeaponCargoGlobal [_x, 1];
		} forEach (blu_crate_specialWeapons select 2);
		
		{
			_crate addBackpackCargoGlobal [_x, (((blu_crate_specialWeapons select 3) select 1) select _forEachIndex)];
		} forEach ((blu_crate_specialWeapons select 3) select 0);
	};
	case "support": {
		{
			_crate addMagazineCargoGlobal [_x, 1];
		} forEach (blu_crate_support select 0);

		{
			_crate addItemCargoGlobal [_x, (((blu_crate_support select 1) select 1) select _forEachIndex)];
		} forEach ((blu_crate_support select 1) select 0);

		{
			_crate addWeaponCargoGlobal [_x, 1];
		} forEach (blu_crate_support select 2);
		
		{
			_crate addBackpackCargoGlobal [_x, (((blu_crate_support select 3) select 1) select _forEachIndex)];
		} forEach ((blu_crate_support select 3) select 0);
	};
	case "equipment": {
		{
			_crate addMagazineCargoGlobal [_x, 1];
		} forEach (blu_crate_equipment select 0);

		{
			_crate addItemCargoGlobal [_x, (((blu_crate_equipment select 1) select 1) select _forEachIndex)];
		} forEach ((blu_crate_equipment select 1) select 0);

		{
			_crate addWeaponCargoGlobal [_x, 1];
		} forEach (blu_crate_equipment select 2);
		
		{
			_crate addBackpackCargoGlobal [_x, (((blu_crate_equipment select 3) select 1) select _forEachIndex)];
		} forEach ((blu_crate_equipment select 3) select 0);
	};
	case "uniform": {
		{
			_crate addMagazineCargoGlobal [_x, 1];
		} forEach (blu_crate_uniform select 0);

		{
			_crate addItemCargoGlobal [_x, (((blu_crate_uniform select 1) select 1) select _forEachIndex)];
		} forEach ((blu_crate_uniform select 1) select 0);

		{
			_crate addWeaponCargoGlobal [_x, 1];
		} forEach (blu_crate_uniform select 2);
		
		{
			_crate addBackpackCargoGlobal [_x, (((blu_crate_uniform select 3) select 1) select _forEachIndex)];
		} forEach ((blu_crate_uniform select 3) select 0);
	};
	case "explosive": {
		{
			_crate addMagazineCargoGlobal [_x, 1];
		} forEach (blu_crate_explosive select 0);

		{
			_crate addItemCargoGlobal [_x, (((blu_crate_explosive select 1) select 1) select _forEachIndex)];
		} forEach ((blu_crate_explosive select 1) select 0);

		{
			_crate addWeaponCargoGlobal [_x, 1];
		} forEach (blu_crate_explosive select 2);
		
		{
			_crate addBackpackCargoGlobal [_x, (((blu_crate_explosive select 3) select 1) select _forEachIndex)];
		} forEach ((blu_crate_explosive select 3) select 0);
	};
	case "launcher": {
		{
			_crate addMagazineCargoGlobal [_x, 1];
		} forEach (blu_crate_launcher select 0);

		{
			_crate addItemCargoGlobal [_x, (((blu_crate_launcher select 1) select 1) select _forEachIndex)];
		} forEach ((blu_crate_launcher select 1) select 0);

		{
			_crate addWeaponCargoGlobal [_x, 1];
		} forEach (blu_crate_launcher select 2);
		
		{
			_crate addBackpackCargoGlobal [_x, (((blu_crate_launcher select 3) select 1) select _forEachIndex)];
		} forEach ((blu_crate_launcher select 3) select 0);
	};
	case "rations": {
		{
			_crate addMagazineCargoGlobal [_x, 1];
		} forEach (blue_crate_rations select 0);

		{
			_crate addItemCargoGlobal [_x, (((blue_crate_rations select 1) select 1) select _forEachIndex)];
		} forEach ((blue_crate_rations select 1) select 0);

		{
			_crate addWeaponCargoGlobal [_x, 1];
		} forEach (blue_crate_rations select 2);
		
		{
			_crate addBackpackCargoGlobal [_x, (((blue_crate_rations select 3) select 1) select _forEachIndex)];
		} forEach ((blue_crate_rations select 3) select 0);
	};
};