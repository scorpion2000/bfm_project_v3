params ["_marker"];
_inidbi = ["new", "BFM_WorldDetails"] call OO_INIDBI;
["deleteKey", ["Markers", _marker]] call _inidbi;