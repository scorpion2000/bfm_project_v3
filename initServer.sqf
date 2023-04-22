//Load all necessary server settings from database
missionNamespace setVariable ["missionLoading", true, true];
missionNamespace setVariable ["loadingBuildingDamage", true];
missionNamespace setVariable ["loadingAreas", true];
missionNamespace setVariable ["loadingTime", true];
missionNamespace setVariable ["loadingVehicles", true];
missionNamespace setVariable ["loadingConstructions", true];

[] execVM "scripts\factionConfig\BLUFOR\supplyCrates.sqf";
[] execVM "scripts\factionConfig\OPFOR\aircrafts.sqf";
[] execVM "scripts\factionConfig\OPFOR\soldiers.sqf";
[] execVM "scripts\factionConfig\OPFOR\vehicles.sqf";
[] execVM "scripts\factionConfig\OPFOR\statics.sqf";
sleep 3;
/*[] remoteExec ["bfm_fnc_loadBuildingDamage", 2, false];
[] remoteExec ["bfm_fnc_loadAreas", 2, false];
[] remoteExec ["bfm_fnc_loadTime", 2, false];
[] remoteExec ["bfm_fnc_loadVehicles", 2, false];
[] remoteExec ["bfm_fnc_loadConstructions", 2, false];*/

[] call BFM_fnc_loadBuildingDamage;
[] call BFM_fnc_loadAreas;
[] call BFM_fnc_loadTime;
[] call BFM_fnc_loadVehicles;
[] call BFM_fnc_loadConstructions;
[] call BFM_fnc_loadMapMarkers;
[] call BFM_fnc_loadWeather;

//Prepairing HC Connection
addMissionEventHandler ["HandleDisconnect",
{
	//params ["_unit", "_id", "_uid", "_name"];
	[(_this select 0)] remoteExec ["bfm_fnc_savePlayerStats", 2, false];
	false;
}];

addMissionEventHandler ["BuildingChanged",
{
	//params ["_previousObject", "_newObject", "_isRuin"];
	[(_this select 0), (_this select 1), (_this select 2)] remoteExec ["bfm_fnc_saveBuildingDamage", 2, false];
}];


["acex_fortify_objectPlaced", {[(_this select 2)] remoteExec ["bfm_fnc_saveConstruction", 2, false];}] call CBA_fnc_addEventHandler;

missionNamespace setVariable ["serverIsLoading", false];

sleep 1;
_loading = true;
while {_loading} do {
	_l1 = missionNamespace getVariable ["loadingBuildingDamage", false];
	_l2 = missionNamespace getVariable ["loadingAreas", false];
	_l3 = missionNamespace getVariable ["loadingTime", false];
	_l4 = missionNamespace getVariable ["loadingVehicles", false];
	_l5 = missionNamespace getVariable ["loadingConstructions", false];
	if (!_l1 && !_l2 && !_l3 && !_l4 && !_l5) then {
		_loading = false;
		missionNamespace setVariable ["missionLoading", false, true];
	};
	sleep 1;
};
[] execVM "scripts\saveDateTime.sqf";
[] execVM "scripts\playerSave.sqf";
[] execVM "scripts\vehiclePeriodicSave.sqf";
[] execVM "scripts\supplyRunGenerator.sqf";
[] execVM "scripts\periodicWeatherSave.sqf";
[] execVM "scripts\dynamicWeather.sqf";
[] execVM "scripts\periodicOpfResourceGeneration.sqf";

addMissionEventHandler ["EntityRespawned", {
	if (isPlayer (_this select 0)) then {
		[(_this select 0)] remoteExec ["bfm_fnc_respawnMessage", 2, false];
		(_this select 0) setPos getPos bluforBaseSpawnPoint vectorAdd [random [-3, 0, 3], random [-3, 0, 3], 0];
		(_this select 0) setDir (random 360);
	};
}];

addMissionEventHandler ["MarkerCreated", {
	params ["_marker", "_channelNumber", "_owner", "_local"];
	[_marker, _channelNumber] remoteExec ["bfm_fnc_saveMapMarkers", 2, false];
}];

addMissionEventHandler ["MarkerDeleted", {
	params ["_marker", "_local"];
	[_marker] remoteExec ["bfm_fnc_deleteMapMarkers", 2, false];
}];

addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	_area = _unit getVariable ["BFM_AreaKilledIn", objNull];
	_category = _unit getVariable ["BFM_ObjectCategory", ""];
	if (!isNull _area) then {
		[_area, _category, 1] remoteExec ["bfm_fnc_subtractFromAreaResource", 2, false];
		if (_unit getVariable ["BFM_IsStatic", "false"] != "false") then {
			[_area] remoteExec ["bfm_fnc_areaRecalculateStatics", 2, false];
		};
	};
}];