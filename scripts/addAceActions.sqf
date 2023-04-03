////////////////////
//	Vehicle buy
////////////////////
_action = ["BuyCar", "Buy Car", "", {}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyCar1", "Buy M-ATV (100$)", "", {
	_veh = createVehicle ["B_MRAP_01_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL bluefor_vehicleSpawn_1);
	_veh setDir (getDir bluefor_vehicleSpawn_1) + 180;
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -100, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions", "BuyCar"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyCar2", "Buy M-ATV HMG (200$)", "", {
	_veh = createVehicle ["B_MRAP_01_hmg_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL bluefor_vehicleSpawn_1);
	_veh setDir (getDir bluefor_vehicleSpawn_1) + 180;
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -200, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions", "BuyCar"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyCar3", "Polaris DAGOR (75$)", "", {
	_veh = createVehicle ["B_LSV_01_unarmed_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL bluefor_vehicleSpawn_1);
	_veh setDir (getDir bluefor_vehicleSpawn_1) + 180;
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -75, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions", "BuyCar"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyTruck", "Buy Truck", "", {}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyTruck1", "HEMTT Transport Covered (175$)", "", {
	_veh = createVehicle ["B_Truck_01_covered_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL bluefor_vehicleSpawn_1);
	_veh setDir (getDir bluefor_vehicleSpawn_1) + 180;
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -175, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions", "BuyTruck"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyTruck2", "HEMTT Cargo (150$)", "", {
	_veh = createVehicle ["B_Truck_01_cargo_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL bluefor_vehicleSpawn_1);
	_veh setDir (getDir bluefor_vehicleSpawn_1) + 180;
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -150, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions", "BuyTruck"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyTruck2", "HEMTT Fuel (300$)", "", {
	_veh = createVehicle ["B_Truck_01_fuel_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL bluefor_vehicleSpawn_1);
	_veh setDir (getDir bluefor_vehicleSpawn_1) + 180;
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -300, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions", "BuyTruck"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyTruck2", "HEMTT Ammo (300$)", "", {
	_veh = createVehicle ["B_Truck_01_ammo_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL bluefor_vehicleSpawn_1);
	_veh setDir (getDir bluefor_vehicleSpawn_1) + 180;
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -300, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions", "BuyTruck"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyTruck2", "HEMTT Repair (300$)", "", {
	_veh = createVehicle ["B_Truck_01_Repair_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL bluefor_vehicleSpawn_1);
	_veh setDir (getDir bluefor_vehicleSpawn_1) + 180;
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -300, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions", "BuyTruck"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyAPC", "Buy APC", "", {}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyApc1", "Badger IFV (800$)", "", {
	_veh = createVehicle ["B_APC_Wheeled_01_cannon_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL bluefor_vehicleSpawn_1);
	_veh setDir (getDir bluefor_vehicleSpawn_1) + 180;
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -800, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions", "BuyAPC"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyApc2", "Namer (600$)", "", {
	_veh = createVehicle ["B_APC_Tracked_01_rcws_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL bluefor_vehicleSpawn_1);
	_veh setDir (getDir bluefor_vehicleSpawn_1) + 180;
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -600, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions", "BuyAPC"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyApc3", "Nammera (700$)", "", {
	_veh = createVehicle ["B_APC_Tracked_01_CRV_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL bluefor_vehicleSpawn_1);
	_veh setDir (getDir bluefor_vehicleSpawn_1) + 180;
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -700, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions", "BuyAPC"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyApc4", "Rooikat 120 (1000$)", "", {
	_veh = createVehicle ["B_AFV_Wheeled_01_cannon_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL bluefor_vehicleSpawn_1);
	_veh setDir (getDir bluefor_vehicleSpawn_1) + 180;
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -1000, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions", "BuyAPC"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyApc5", "Rooikat 120 (1150$)", "", {
	_veh = createVehicle ["B_AFV_Wheeled_01_up_cannon_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL bluefor_vehicleSpawn_1);
	_veh setDir (getDir bluefor_vehicleSpawn_1) + 180;
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -1150, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions", "BuyAPC"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyAntiAir", "Buy Anti Air", "", {}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyAntiAir1", "Bardelas (1200$)", "", {
	_veh = createVehicle ["B_AFV_Wheeled_01_up_cannon_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL bluefor_vehicleSpawn_1);
	_veh setDir (getDir bluefor_vehicleSpawn_1) + 180;
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -1200, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions", "BuyAntiAir"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyTank", "Buy Tank", "", {}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyTank1", "Merkava Mk IV M (1800$)", "", {
	_veh = createVehicle ["B_MBT_01_cannon_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL bluefor_vehicleSpawn_1);
	_veh setDir (getDir bluefor_vehicleSpawn_1) + 180;
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -1800, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions", "BuyTank"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyTank2", "Merkava Mk IV LIC (2000$)", "", {
	_veh = createVehicle ["B_MBT_01_TUSK_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL bluefor_vehicleSpawn_1);
	_veh setDir (getDir bluefor_vehicleSpawn_1) + 180;
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -2000, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[vehicleBuyLaptop, 0, ["ACE_MainActions", "BuyTank"], _action] call ace_interact_menu_fnc_addActionToObject;

////////////////////
//	Helicopter buy
////////////////////

_action = ["BuyTransport", "Buy Transport Helicopter", "", {}, {true}] call ace_interact_menu_fnc_createAction;
[helicopterBuyLaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyTransport1", "CH-46I Chinook Armed (1250$)", "", {
	_veh = createVehicle ["B_Heli_Transport_03_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL blufor_helicopterSpawn_1);
	_veh setDir (getDir blufor_helicopterSpawn_1);
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -1250, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[helicopterBuyLaptop, 0, ["ACE_MainActions", "BuyTransport"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyTransport2", "CH-46I Chinook (1000$)", "", {
	_veh = createVehicle ["B_Heli_Transport_03_unarmed_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL blufor_helicopterSpawn_1);
	_veh setDir (getDir blufor_helicopterSpawn_1);
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -1000, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[helicopterBuyLaptop, 0, ["ACE_MainActions", "BuyTransport"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyTransport3", "UH-80 Ghost Hawk (700$)", "", {
	_veh = createVehicle ["B_Heli_Transport_01_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL blufor_helicopterSpawn_1);
	_veh setDir (getDir blufor_helicopterSpawn_1);
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -700, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[helicopterBuyLaptop, 0, ["ACE_MainActions", "BuyTransport"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyAttack", "Buy Attack Helicopter", "", {}, {true}] call ace_interact_menu_fnc_createAction;
[helicopterBuyLaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyAttack1", "RAH-66 Comanche (1750$)", "", {
	_veh = createVehicle ["B_Heli_Attack_01_dynamicLoadout_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL blufor_helicopterSpawn_1);
	_veh setDir (getDir blufor_helicopterSpawn_1);
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -1750, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[helicopterBuyLaptop, 0, ["ACE_MainActions", "BuyAttack"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyLittle", "Buy Little Birds", "", {}, {true}] call ace_interact_menu_fnc_createAction;
[helicopterBuyLaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyLittle1", "AH-6 Little Bird (1000$)", "", {
	_veh = createVehicle ["B_Heli_Light_01_dynamicLoadout_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL blufor_helicopterSpawn_1);
	_veh setDir (getDir blufor_helicopterSpawn_1);
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -1000, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[helicopterBuyLaptop, 0, ["ACE_MainActions", "BuyLittle"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyLittle2", "MH-6 Little Bird (500$)", "", {
	_veh = createVehicle ["B_Heli_Light_01_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_veh setPosATL (getPosATL blufor_helicopterSpawn_1);
	_veh setDir (getDir blufor_helicopterSpawn_1);
	[_veh] remoteExec ["bfm_fnc_saveVehicle", 2, false];
	[west, -500, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[helicopterBuyLaptop, 0, ["ACE_MainActions", "BuyLittle"], _action] call ace_interact_menu_fnc_addActionToObject;

crateSpawnArray = [blu_crateSpawn_1, blu_crateSpawn_2, blu_crateSpawn_3, blu_crateSpawn_4, blu_crateSpawn_5, blu_crateSpawn_6];

////////////////////
//	Crate buy
////////////////////

_action = ["BuyCrate1", "Buy empty crate (5$)", "", {
	_crate = createVehicle ["CargoNet_01_box_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_crate setPosATL (getPosATL (selectRandom crateSpawnArray));
	_crate setDir (random 360);
	[_crate, true, [0, 3, 1], 10] call ace_dragging_fnc_setCarryable;
	[west, -5, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
	ACE_maxWeightCarry = 4000;
	publicVariable "ACE_maxWeightCarry";
	[_crate] remoteExec ["bfm_fnc_saveVehicle", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[crateBuyLaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyCrate2", "Buy Ammunitions Crate (25$)", "", {
	_crate = createVehicle ["CargoNet_01_box_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_crate setPosATL (getPosATL (selectRandom crateSpawnArray));
	_crate setDir (random 360);
	[_crate, true, [0, 3, 1], 10] call ace_dragging_fnc_setCarryable;
	[west, -25, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
	["ammo",_crate] remoteExec ["bfm_fnc_applyCratePreset", 2, false];
	ACE_maxWeightCarry = 4000;
	publicVariable "ACE_maxWeightCarry";
	[_crate] remoteExec ["bfm_fnc_saveVehicle", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[crateBuyLaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyCrate3", "Buy Basic Weapons Crate (40$)", "", {
	_crate = createVehicle ["CargoNet_01_box_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_crate setPosATL (getPosATL (selectRandom crateSpawnArray));
	_crate setDir (random 360);
	[_crate, true, [0, 3, 1], 10] call ace_dragging_fnc_setCarryable;
	[west, -40, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
	["basicWeapons",_crate] remoteExec ["bfm_fnc_applyCratePreset", 2, false];
	ACE_maxWeightCarry = 4000;
	publicVariable "ACE_maxWeightCarry";
	[_crate] remoteExec ["bfm_fnc_saveVehicle", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[crateBuyLaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyCrate4", "Buy Special Weapons Crate (55$)", "", {
	_crate = createVehicle ["CargoNet_01_box_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_crate setPosATL (getPosATL (selectRandom crateSpawnArray));
	_crate setDir (random 360);
	[_crate, true, [0, 3, 1], 10] call ace_dragging_fnc_setCarryable;
	[west, -55, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
	["specialWeapons",_crate] remoteExec ["bfm_fnc_applyCratePreset", 2, false];
	ACE_maxWeightCarry = 4000;
	publicVariable "ACE_maxWeightCarry";
	[_crate] remoteExec ["bfm_fnc_saveVehicle", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[crateBuyLaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyCrate5", "Buy Support Crate (35$)", "", {
	_crate = createVehicle ["CargoNet_01_box_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_crate setPosATL (getPosATL (selectRandom crateSpawnArray));
	_crate setDir (random 360);
	[_crate, true, [0, 3, 1], 10] call ace_dragging_fnc_setCarryable;
	[west, -35, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
	["support",_crate] remoteExec ["bfm_fnc_applyCratePreset", 2, false];
	ACE_maxWeightCarry = 4000;
	publicVariable "ACE_maxWeightCarry";
	[_crate] remoteExec ["bfm_fnc_saveVehicle", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[crateBuyLaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyCrate6", "Buy Equipment Crate (40$)", "", {
	_crate = createVehicle ["CargoNet_01_box_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_crate setPosATL (getPosATL (selectRandom crateSpawnArray));
	_crate setDir (random 360);
	[_crate, true, [0, 3, 1], 10] call ace_dragging_fnc_setCarryable;
	[west, -40, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
	["equipment",_crate] remoteExec ["bfm_fnc_applyCratePreset", 2, false];
	ACE_maxWeightCarry = 4000;
	publicVariable "ACE_maxWeightCarry";
	[_crate] remoteExec ["bfm_fnc_saveVehicle", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[crateBuyLaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyCrate7", "Buy Uniform Crate (15$)", "", {
	_crate = createVehicle ["CargoNet_01_box_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_crate setPosATL (getPosATL (selectRandom crateSpawnArray));
	_crate setDir (random 360);
	[_crate, true, [0, 3, 1], 10] call ace_dragging_fnc_setCarryable;
	[west, -15, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
	["uniform",_crate] remoteExec ["bfm_fnc_applyCratePreset", 2, false];
	ACE_maxWeightCarry = 4000;
	publicVariable "ACE_maxWeightCarry";
	[_crate] remoteExec ["bfm_fnc_saveVehicle", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[crateBuyLaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyCrate8", "Buy Explosives Crate (70$)", "", {
	_crate = createVehicle ["CargoNet_01_box_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_crate setPosATL (getPosATL (selectRandom crateSpawnArray));
	_crate setDir (random 360);
	[_crate, true, [0, 3, 1], 10] call ace_dragging_fnc_setCarryable;
	[west, -70, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
	["explosive",_crate] remoteExec ["bfm_fnc_applyCratePreset", 2, false];
	ACE_maxWeightCarry = 4000;
	publicVariable "ACE_maxWeightCarry";
	[_crate] remoteExec ["bfm_fnc_saveVehicle", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[crateBuyLaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyCrate9", "Buy Launchers Crate (100$)", "", {
	_crate = createVehicle ["CargoNet_01_box_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_crate setPosATL (getPosATL (selectRandom crateSpawnArray));
	_crate setDir (random 360);
	[_crate, true, [0, 3, 1], 10] call ace_dragging_fnc_setCarryable;
	[west, -100, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
	["launcher",_crate] remoteExec ["bfm_fnc_applyCratePreset", 2, false];
	ACE_maxWeightCarry = 4000;
	publicVariable "ACE_maxWeightCarry";
	[_crate] remoteExec ["bfm_fnc_saveVehicle", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[crateBuyLaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["BuyCrate10", "Buy Rations Crate (20$)", "", {
	_crate = createVehicle ["CargoNet_01_box_F", [0, 0, 500], [], 0, "CAN_COLLIDE"];
	_crate setPosATL (getPosATL (selectRandom crateSpawnArray));
	_crate setDir (random 360);
	[_crate, true, [0, 3, 1], 10] call ace_dragging_fnc_setCarryable;
	[west, -20, false] call acex_fortify_fnc_updateBudget;
	[] remoteExec ["bfm_fnc_saveConstruction", 2, false];
	["rations",_crate] remoteExec ["bfm_fnc_applyCratePreset", 2, false];
	ACE_maxWeightCarry = 4000;
	publicVariable "ACE_maxWeightCarry";
	[_crate] remoteExec ["bfm_fnc_saveVehicle", 2, false];
}, {true}] call ace_interact_menu_fnc_createAction;
[crateBuyLaptop, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
