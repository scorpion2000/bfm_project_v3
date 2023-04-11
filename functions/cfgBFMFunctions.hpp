class BFMFunctions {
	tag = "BFM";

	class BFM_Random
	{
		file = "functions";
		
		class deployPlayer {};
		class applyCratePreset {};
		class findAreaObjectByName {};
		class scoreBuilding {};
		class subtractFromAreaResource {};
		class areaRecalculateStatics {};
	};
	
	class BFM_PlayerPersistance 
	{
		file = "functions\persistance\player";
		
		class deletePlayer {};
		class savePlayerStats {};
		class loadPlayerStats {};
		class welcomeMessage {};
		class respawnMessage {};
	};

	class BFM_AI_Commander_Static
	{
		file = "functions\AI_Commander\static";
		
		class findCapital {};
		class generateStartingResources {};
		class generateResources {};
	};

	class BFM_AI_Commander_Logic
	{
		file = "functions\AI_Commander\logic";

		class supplySystem {};
		class activateArea {};
		class deactivateArea {};
		class checkForAreaDeactivation {};
	};

	class BFM_OPFOR_Spawners
	{
		file = "functions\opf_spawn";

		class createSupplyRun {};
		class deployResourcesInArea {};
		class despawnResourcesInArea {};
	};

	class BFM_ServerPersistance 
	{
		file = "functions\persistance\server";
		class deleteVehicle {};
		class deleteMapMarkers {};

		//class savePatrol {};
		class saveAreas {};
		class saveVehicle {};
		class saveTime {};
		class saveSupplyRun {};
		class saveConstruction {};
		class saveBuildingDamage {};
		class saveMapMarkers {};
		class saveWeather {};

		//class loadPatrols {};
		class loadBuildingDamage {};
		class loadAreas {};
		class loadVehicles {};
		class loadSupplyRun {};
		class loadTime {};
		class loadConstructions {};
		class loadMapMarkers {};
		class loadWeather {};
	};

	class BFM_Debug
	{
		file = "functions\debug";
		
		class perfMeter {};
	};

	class BFM_PlayerActions
	{
		file = "functions\player_actions";
		
		class checkForArea {};
	};
};