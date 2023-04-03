_inidbi = ["new", "BFM_WorldDetails"] call OO_INIDBI;

if ("exists" call _inidbi) then {
	_date = ["read", ["time", "missionDate", []]] call _inidbi;
	if (!isnil "_date") then {
		setDate _date;
	}
};
missionNamespace setVariable ["loadingTime", false];