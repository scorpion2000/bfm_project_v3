params ["_category", "_position", "_id"];

_inidbi = ["new", "BFM_OpforDetails"] call OO_INIDBI;
["write", ["constructions", _id, [_category, _position]]] call _inidbi;