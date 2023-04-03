class BFMFunctions {
	tag = "BFM";

	class BFM_Random
	{
		file = "functions";
		
		class deployPlayer {};
		class applyCratePreset {};
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
	};

	class BFM_OPFOR_Spawners
	{
		file = "functions\opf_spawn";

		class createSupplyRun {};
	};

	class BFM_ServerPersistance 
	{
		file = "functions\persistance\server";
		class deleteVehicle {};
		class loadPatrols {};
		class saveAreas {};
		class savePatrol {};
		class saveVehicle {};
		class saveTime {};
		class saveSupplyRun {};
		class saveConstruction {};
		class saveBuildingDamage {};
		class saveVehicleInventory {};
		class loadBuildingDamage {};
		class loadAreas {};
		class loadVehicles {};
		class loadSupplyRun {};
		class loadTime {};
		class loadConstructions {};
		class loadVehicleInventory {};
	};

	class BFM_Debug
	{
		file = "functions\debug";
		
		class perfMeter {};
	};
};