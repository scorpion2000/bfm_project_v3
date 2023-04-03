player addEventHandler ["InventoryClosed", {
	params ["_unit", "_container"];
	if (_container == missionNamespace getVariable ["moneyContainer", null]) then
	{
		if ("myMoneyItem" in ((magazineCargo _container + (backpackItems _container))))
		{
			waterContainer = missionNamespace getVariable ["waterContainer", null];
			amount = 0;

			//Csináljunk előtt kalkulációt mennyiségre
			waterContainer addItemCargo ["myWaterItem", amount];
		}
	};
}];