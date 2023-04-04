/*
	SAVE PARAMS
		Position (ASL)
		Direction
		Stance
		Fatigue
		ACEX Field ration
		ACE Medical status
*/

params ["_player"];

//systemChat "Starting Player Stat Save";
_playerDBid = ["BFM_Players\player",getPlayerUID _player] joinString "_";
_inidbi = ["new", _playerDBid] call OO_INIDBI;
["write", ["general", "name", name _player]] call _inidbi;
["write", ["general", "positionATL", getPosATL _player]] call _inidbi;
["write", ["general", "direction", getDir _player]] call _inidbi;
["write", ["general", "stance", stance _player]] call _inidbi;

_fatigueArray = [];
_fatigueArray pushBack (if (isNil {_player getVariable "ace_advanced_fatigue_anreserve"}) then {"NONE"} else {_player getVariable "ace_advanced_fatigue_anreserve"});
_fatigueArray pushBack (if (isNil {_player getVariable "ace_advanced_fatigue_muscledamage"}) then {"NONE"} else {_player getVariable "ace_advanced_fatigue_muscledamage"});
_fatigueArray pushBack (if (isNil {_player getVariable "ace_advanced_fatigue_anfatigue"}) then {"NONE"} else {_player getVariable "ace_advanced_fatigue_anfatigue"});
_fatigueArray pushBack (if (isNil {_player getVariable "ace_advanced_fatigue_aimfatigue"}) then {"NONE"} else {_player getVariable "ace_advanced_fatigue_aimfatigue"});
_fatigueArray pushBack (if (isNil {_player getVariable "ace_advanced_fatigue_animhandler"}) then {"NONE"} else {_player getVariable "ace_advanced_fatigue_animhandler"});
_fatigueArray pushBack (if (isNil {_player getVariable "ace_advanced_fatigue_ae2reserve"}) then {"NONE"} else {_player getVariable "ace_advanced_fatigue_ae2reserve"});
_fatigueArray pushBack (if (isNil {_player getVariable "ace_advanced_fatigue_ae1reserve"}) then {"NONE"} else {_player getVariable "ace_advanced_fatigue_ae1reserve"});
["write", ["general", "aceFatigue", _fatigueArray]] call _inidbi;

_rationsArray = [];
_rationsArray pushBack (if (isNil {_player getVariable "acex_field_rations_consumableactionscache"}) then {"NONE"} else {_player getVariable "acex_field_rations_consumableactionscache"});
_rationsArray pushBack (if (isNil {_player getVariable "acex_field_rations_hunger"}) then {"NONE"} else {_player getVariable "acex_field_rations_hunger"});
_rationsArray pushBack (if (isNil {_player getVariable "acex_field_rations_thirst"}) then {"NONE"} else {_player getVariable "acex_field_rations_thirst"});
["write", ["general", "aceRations", _rationsArray]] call _inidbi;

_armaValues = getAllHitPointsDamage _player;
["write", ["general", "hitPointDamage", _armaValues]] call _inidbi;
_aceValues = [];
_aceChecks = [
	["ace_medical_bloodVolume",6.0],
	["ace_medical_heartRate",80],
	["ace_medical_bloodPressure",[80, 120]],
	["ace_medical_peripheralResistance",100],
	["ace_medical_inCardiacArrest",false],
	["ace_medical_hemorrhage",0],
	["ace_medical_pain",0],
	["ace_medical_inPain",false],
	["ace_medical_painSuppress",0],
	["ace_medical_openWounds",[]],
	["ace_medical_bandagedWounds",[]],
	["ace_medical_stitchedWounds",[]],
	["ace_medical_isLimping",false],
	["ace_medical_fractures",[0,0,0,0,0,0]],
	["ACE_isUnconscious",false],
	["ace_medical_tourniquets",[0,0,0,0,0,0]],
	//["ace_medical_occludedMedications",nil],
	["ace_medical_triageLevel",0],
	["ace_medical_triageCard",[]],
	["ace_medical_bodyPartDamage",[0,0,0,0,0,0]],
	["ace_medical_medications",[]]
	//["ace_medical_lastWakeUpCheck",nil],
	//["ace_medical_causeOfDeath",nil]
];

{
	_aceValues pushBack [(_x select 0), _player getVariable [(_x select 0), (_x select 1)], true];
} forEach _aceChecks;
["write", ["general", "aceMedical", _aceValues]] call _inidbi;

_katValues = [];
_katChecks = [
	["kat_airway_obstruction",false],
	["kat_airway_occluded",false],
	["kat_airway_airway",false],
	["kat_airway_overstretch",false],
	["kat_airway_recovery",false],
	["kat_breathing_airwayStatus",100],
	["kat_breathing_pneumothorax",false],
	["kat_breathing_hemopneumothorax",false],
	["kat_breathing_tensionpneumothorax",false],
	["kat_breathing_pulseoximeter",false],
	["kat_chemical_timeleft",missionNamespace getVariable ["kat_chemical_infectionTime", 60]],
	["kat_chemical_enteredPoison",false],
	["kat_chemical_gasmask_durability",10],
	["kat_chemical_gasmask_durability_reset",false],
	["kat_chemical_chemDetectorState",true],
	["kat_circulation_X",false],
	["kat_circulation_X_sound1",true],
	["kat_circulation_X_sound2",true],
	["kat_circulation_use",false],
	["kat_circulation_returnedAED",false],
	["kat_circulation_asystole",1],
	["kat_circulation_CPRcount",2],
	["kat_circulation_AEDinUse",false],
	["kat_circulation_soundPlayed",false],
	["kat_circulation_AEDvehicleName",""],
	["kat_circulation_vehicleTrue",false],
	["kat_circulation_AEDvehicle",false],
	["kat_pharma_IV",[0,0,0,0,0,0]],
	["kat_pharma_IVpfh",[0,0,0,0,0,0]],
	["kat_pharma_active",false],
	["kat_pharma_alphaAction",1],
	["kat_pharma_TXA",1],
	["kat_pharma_pH",1500],
	["kat_pharma_coagulationFactor",10],
	["kat_pharma_kidneyFail",false],
	["kat_pharma_kidneyArrest",false],
	["kat_pharma_kidneyPressure",false],
	["kat_surgery_debridement",[0,0,0,0,0,0]],
	["kat_surgery_fractures",[0,0,0,0,0,0]],
	["kat_surgery_lidocaine",false],
	["kat_surgery_etomidate",false],
	["kat_surgery_sedated",false]
];

{
	_katValues pushBack [(_x select 0), _player getVariable [(_x select 0), (_x select 1)], true];
} forEach _katChecks;
["write", ["general", "katMedical", _katValues]] call _inidbi;

if (!isNull objectParent _player) then {
	if ((vehicle _player) getVariable ["vehicleIndex", "-1"] != "-1") then {
		["write", ["general", "vehicle", (vehicle _player) getVariable "vehicleIndex"]] call _inidbi;
	} else {
		["write", ["general", "vehicle", "-1"]] call _inidbi;
	};
} else {
	["write", ["general", "vehicle", "-1"]] call _inidbi;
};
["write", ["general", "loadout", getUnitLoadout _player]] call _inidbi;
["write", ["general", "isAlive", alive _player]] call _inidbi;

_aceMedicalLogs = [];
{
	_aceMedicalLogs pushBack [_x, _player getVariable [_x, []]];
} forEach (_player getVariable ["ace_medical_allLogs",[]]);

["write", ["general", "aceMedicalLogs", _aceMedicalLogs]] call _inidbi;
