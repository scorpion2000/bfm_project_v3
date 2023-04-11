_inidbi = ["new", "BFM_WorldDetails"] call OO_INIDBI;

_fogLevel = ["read", ["weather", "fog"]] call _inidbi;
_overcastLevel = ["read", ["weather", "overcast"]] call _inidbi;
_rainLevel = ["read", ["weather", "rain"]] call _inidbi;
_humidityLevel = ["read", ["weather", "humidity"]] call _inidbi;

if (str _fogLevel != "false") then { 0 setFog _fogLevel };
if (str _overcastLevel != "false") then { 0 setOvercast _overcastLevel };
if (str _rainLevel != "false") then { 0 setRain _rainLevel };
if (str _humidityLevel != "false") then { setHumidity _humidityLevel };
forceWeatherChange;