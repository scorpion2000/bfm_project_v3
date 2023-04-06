_inidbi = ["new", "BFM_WorldDetails"] call OO_INIDBI;
_keysArray = ["getKeys", "Markers"] call _inidbi;

{
	_result = (["read", ["Markers", _x]] call _inidbi);
	//Refference
	//_saveArray = [_markerText, _channelNumber, _markerPos, _markerType, _markerColor, _markerDir, _markerAlpha, _markerSize, _markerShadow, _markerShape, _markerPolyline];
	_markerText = (_result select 0);
	_markerChannelNumber = (_result select 1);
	_markerPos = (_result select 2);
	_markerType = (_result select 3);
	_markerColor = (_result select 4);
	_markerDir = (_result select 5);
	_markerAlpha = (_result select 6);
	_markerSize = (_result select 7);
	_markerShadow = (_result select 8);
	_markerShape = (_result select 9);
	_markerPolyline = (_result select 10);

	_marker = createMarker [_x, _markerPos, _markerChannelNumber];
	_marker setMarkerText _markerText;
	_marker setMarkerPos _markerPos;
	_marker setMarkerType _markerType;
	_marker setMarkerColor _markerColor;
	_marker setMarkerDir _markerDir;
	_marker setMarkerAlpha _markerAlpha;
	_marker setMarkerSize _markerSize;
	_marker setMarkerShadow _markerShadow;
	_marker setMarkerShape _markerShape;
	if (_markerShape == "POLYLINE") then { _marker setMarkerPolyline _markerPolyline; };
} forEach _keysArray;