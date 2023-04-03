while {true} do {
	sleep 120;
	_vehicleArray = missionNamespace getVariable ["vehicleList", []];
	{
		[_x] remoteExec ["bfm_fnc_saveVehicle", 2, false];
		sleep 0.1;
	} forEach _vehicleArray;
}