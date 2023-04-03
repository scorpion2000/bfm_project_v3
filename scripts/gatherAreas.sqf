//This script will run only if the area inidb file is empty

//Area array setup
/*
	[
		_score,				//The score the area got based on nearby buildings
		_markerName,		//The marker associated to the area
		_trigger,			//The trigger associated with the area
		_isActive,			//A simple check to see if the area is active
		_isTaken,			//Check if BLUEFOR has taken the objective already
		_underAttack,		//Check if area is under attack
		_creationOrder,		//The next asset to be created here
		[
			_multiPurpuseSoldier,	//Can be used for medics, marskmans, regular riflemans, machinegunners and so on
			_tank,
			_APC,
			_armedVehicle,			//Can be heavily armored cars or just lada with a machine gun
			_AAgun,					//Generally launchers, but can be anything defined in the config
			_ATgun,					//Generally launchers, but can be anything defined in the config
			_staticGun,				//Generally static machine guns, but can be anything defined in the config
			_transportVehicle		//Generally any transport vehicle, but can be anything defined in the config
		],
		_productionFocus,		//0 = materials, 1 = manpower, 2 = balanced
		_productionLevel,		//1 - 3
		_mixMat,				//Minimum material the commander should keep in the area
		_mixMan,				//Minimum manpower the commander should keep in the area
		_storedMaterial,
		_storedManpower,
		_isCapital,
		_requestingReinforcements		//When an area is running low on units, this variable is set to true. Any area that has this value set to false will send over units
	]
*/

_allMapMarkers = allMapMarkers;

_inidbi = ["new", "BFM_OpforDetails"] call OO_INIDBI;
["deleteSection", "Areas"] call _inidbi;

_foundAreas = 0;

{
	if ((str _x) find "marker" != -1) then {
		//Score the area
		_score = 0;
		_areaPosition = getMarkerPos _x;
		_buildings = nearestObjects [_areaPosition, ["Building", "House"], 1000];
		{
			if (count([_x] call BIS_fnc_buildingPositions) > 1) then {
				_cfg = configFile >> "CfgVehicles" >> typeOf _x; 
				_EdenCat = getText( _cfg >> "editorCategory" ); 
				_EdenSubCat = getText( _cfg >> "editorSubcategory" ); 
				
				if !( _EdenCat isEqualTo "" ) then { 
				_EdenCat = getText( configFile >> "CfgEditorCategories" >> _EdenCat >> "displayName" ); 
				}; 
				
				if !( _EdenSubCat isEqualTo "" ) then { 
				_EdenSubCat = getText( configFile >> "CfgEditorSubCategories" >> _EdenSubCat >> "displayName" ); 
				};
				
				if (_EdenSubCat == "Military" || _EdenSubCat == "Airport") then {
					_score = _score +20;
				};
				if (_EdenSubCat == "City" || _EdenSubCat == "Village" || _EdenSubCat == "Shop" || _EdenSubCat == "Services" || _EdenSubCat == "Religious" || _EdenSubCat == "Utilities" || _EdenSubCat == "Seaport") then {
					_score = _score + 1;
				};
				if (_EdenSubCat == "Industrial" || _EdenSubCat == "Construction Sites") then {
					_score = _score + 8;
				};
			}
		} foreach _buildings;

		_minMat = _score * 2;
		_minMan = _score / 10;

		//Save the area
		_str = _x splitString "_";
		//systemChat str _str;
		_triggerToSearch = format ["areaTrigger_%1", (_str select 1)];
		_trigger = missionNamespace getVariable [_triggerToSearch , objNull];
		if !(isNull _trigger) then {
			_saveArray = [
				_score,
				_x,
				str _trigger,
				false,
				false,
				false,
				"",
				[
					0,
					0,
					0,
					0,
					0,
					0
				],
				2,
				1,
				_minMat,
				_minMan,
				0,
				0,
				false,
				false
			];

			_key = format ["area_%1", (_str select 1)];
			//systemChat str _saveArray;
			_asd = ["write", ["Areas", _key, _saveArray]] call _inidbi;
			if (_asd) then {
				//systemChat "yes";
			}
		}
	}
} forEach _allMapMarkers;
sleep 1;
[] remoteExec ["bfm_fnc_loadAreas", 2, false];
sleep 1;
[] remoteExec ["bfm_fnc_findCapital", 2, false];
sleep 1;
[] remoteExec ["bfm_fnc_generateStartingResources", 2, false];