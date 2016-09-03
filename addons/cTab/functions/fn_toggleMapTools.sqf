/*
 	Name: cTab_fnc_toggleMapTools

 	Author(s):
		Gundy

 	Description:
		Toggle drawing of map tools


	Parameters:
		0: STRING - Name of uiNamespace variable for interface

 	Returns:
		BOOLEAN - Draw map tools

 	Example:
		cTabDrawMapTools = call cTab_fnc_toggleMapTools;
*/

params ["_displayName"];

private _currentMapTools = [_displayName,"mapTools"] call cTab_fnc_getSettings;
private _newMapTools = if (_currentMapTools) then {false} else {true};
[_displayName,[["mapTools",_newMapTools]]] call cTab_fnc_setSettings;
_newMapTools