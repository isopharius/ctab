/*
 	Name: cTab_fnc_isDialog

 	Author(s):
		Gundy

 	Description:
		Check if interface name ends with "dlg"

	Parameters:
		0: Name of interface

 	Returns:
		BOOLEAN - True if interface name ends with "dlg"

 	Example:
 		// returns true
		["cTab_Tablet_dlg"] call cTab_fnc_isDialog;

		// returns false
		["cTab_TAD_dsp"] call cTab_fnc_isDialog;
*/

params ["_interfaceName"];

// select the last three characters from the interface name
private _subString = _interfaceName select [(count _interfaceName) - 3];

if (_subString isEqualTo "dlg") then {true} else {false};