params ["_playerUID"];

_inidbi = ["new", "BFM_PlayerStats"] call OO_INIDBI;
_response = ["deleteKey", ["playerPersistance", _playerUID]] call _inidbi;

systemChat str _response;