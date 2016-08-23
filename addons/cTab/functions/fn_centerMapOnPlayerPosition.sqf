/*
 	Name: cTab_fnc_centerMapOnPlayerPosition

 	Author(s):
		Gundy

 	Description:
		Center BFT Map on current player position

	Parameters:
		0: STRING - Name of uiNamespace display / dialog variable

 	Returns:
		BOOLEAN - TRUE

 	Example:
		['cTab_TAD_dlg'] call cTab_fnc_centerMapOnPlayerPosition;
*/

[_this select 0,[["mapWorldPos",getPosWorld vehicle cTab_player]],true,true] call cTab_fnc_setSettings;

true