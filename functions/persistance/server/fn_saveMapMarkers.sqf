params ["_name", "_channelNumber"];

if ((_channelNumber == 0 || _channelNumber == 1)) then {
	_inidbi = ["new", "BFM_WorldDetails"] call OO_INIDBI;
	_markerPos = markerPos _name;
	_markerType = markerType _name;
	_markerColor = getMarkerColor _name;
	_markerText = markerText _name;
	_markerDir = markerDir _name;
	_markerAlpha = markerAlpha _name;
	_markerSize = markerSize _name;
	_markerShadow = markerShadow _name;
	_markerShape = markerShape _name;
	_markerPolyline = markerPolyline _name;
	_saveArray = [_markerText, _channelNumber, _markerPos, _markerType, _markerColor, _markerDir, _markerAlpha, _markerSize, _markerShadow, _markerShape, _markerPolyline];
	systemChat str _saveArray;
	["write", ["Markers", _name, _saveArray]] call _inidbi;
};