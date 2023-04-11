_inidbi = ["new", "BFM_WorldDetails"] call OO_INIDBI;

["write", ["weather", "fog", fog]] call _inidbi;
["write", ["weather", "overcast", overcast]] call _inidbi;
["write", ["weather", "rain", rain]] call _inidbi;
["write", ["weather", "humidity", humidity]] call _inidbi;