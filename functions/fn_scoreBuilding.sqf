params ["_building"];

_score = 0;
_cfg = configFile >> "CfgVehicles" >> typeOf _building; 
_EdenCat = getText( _cfg >> "editorCategory" ); 
_EdenSubCat = getText( _cfg >> "editorSubcategory" );
if !( _EdenCat isEqualTo "" ) then { 
	_EdenCat = getText( configFile >> "CfgEditorCategories" >> _EdenCat >> "displayName" ); 
}; 

if !( _EdenSubCat isEqualTo "" ) then { 
	_EdenSubCat = getText( configFile >> "CfgEditorSubCategories" >> _EdenSubCat >> "displayName" ); 
}; 

/*if (_EdenSubCat == "Military" || _EdenSubCat == "Airport") then { _score = _score + 10; }
else if (_EdenSubCat == "City" || _EdenSubCat == "Village" || _EdenSubCat == "Shop" || _EdenSubCat == "Services" || _EdenSubCat == "Religious" || _EdenSubCat == "Utilities" || _EdenSubCat == "Seaport") then { _score = _score + 3; }
else if (_EdenSubCat == "Industrial" || _EdenSubCat == "Construction Sites") then { _score = _score + 6; };*/
switch (_EdenSubCat) do {
	case "Military": { _score = _score + 10; };
	case "Airport": { _score = _score + 10; };
	case "City": { _score = _score + 3; };
	case "Village": { _score = _score + 3; };
	case "Shop": { _score = _score + 3; };
	case "Services": { _score = _score + 3; };
	case "Religious": { _score = _score + 3; };
	case "Utilities": { _score = _score + 3; };
	case "Seaport": { _score = _score + 3; };
	case "Industrial": { _score = _score + 6; };
	case "Construction Sites": { _score = _score + 6; };
	default { };
};

_score