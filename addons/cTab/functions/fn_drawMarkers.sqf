/*
 	Name: cTab_fnc_drawMarkers

 	Author(s):
		Gundy

 	Description:
		Draw map markers provided by allMapMarkers.

	Parameters:
		0: OBJECT  - Map control to draw BFT icons on

 	Returns:
		BOOLEAN - Always TRUE

 	Example:
		[_ctrlScreen] call cTab_fnc_drawMarkers;
*/

params ["_ctrlScreen"];
private ["_marker","_pos","_type","_size","_icon","_colorType","_color","_brush","_brushType","_shape","_alpha","_dir","_text"];

{
	_marker = _x;

	_pos = getMarkerPos _marker;
	_type = getMarkerType _marker;
	_size = getMarkerSize _marker;
	_icon = getText(configFile/"CfgMarkers"/_type/"Icon");
	_colorType = getMarkerColor _marker;
	if (_icon != "" && {_colorType isEqualTo "Default"}) then {
		_color = getArray(configFile/"CfgMarkers"/_type/"color");
	} else {
		_color = getArray(configFile/"CfgMarkerColors"/_colorType/"color");
	};
	if ((_color select 0) isEqualType "") then {
		_color = [
			call compile (_color select 0),
			call compile (_color select 1),
			call compile (_color select 2),
			call compile (_color select 3)
		];
	};
	_brushType = markerBrush _marker;
	_brush = getText(configFile/"CfgMarkerBrushes"/_brushType/"texture");
	_shape = markerShape _marker;
	_alpha = markerAlpha _marker;
	_dir = markerDir _marker;
	_text = markerText _marker;

	call {
		if (_shape isEqualTo "ICON") exitWith {
			_ctrlScreen drawIcon [_icon,_color,_pos,(_size select 0) * cTabIconSize,(_size select 1) * cTabIconSize,_dir,_text,0,cTabTxtSize,"TahomaB","right"];
		};
		if (_shape isEqualTo "RECTANGLE") exitWith {
	    	_ctrlScreen drawRectangle [_pos,_size select 0,_size select 1,_dir,_color,_brush];
		};
		if (_shape isEqualTo "ELLIPSE") then {
	    	_ctrlScreen drawEllipse [_pos,_size select 0,_size select 1,_dir,_color,_brush];
		};
	};
} forEach allMapMarkers;

true