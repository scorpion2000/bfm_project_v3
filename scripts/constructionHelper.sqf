//This script helps gather objects from a given position. The objects will be copied to clipboard in a pastable format
//Used for getting opfor constructions

_allObjects = nearestObjects [trig, [], 200];
_baseObject = _allObjects select 0;
_baseObjectPosition = getPosATL _baseObject;
_constructionArray = [];

{
	_objectPosition = getPosATL _x;
	_objectType = typeOf _x;
	_relativePosition = [(_baseObjectPosition select 0) - (_objectPosition select 0), (_baseObjectPosition select 1) - (_objectPosition select 1), 0];

	_item = [_objectType, _relativePosition];
	_constructionArray pushBack _item;
} forEach _allObjects;

copyToClipboard str _constructionArray;