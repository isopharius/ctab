/*
	Name: cTab_fnc_getPlayerSides

	Author(s):
		Gundy

	Description:
		Compile a list of valid sides based on the set encryption keys of the current player

	Parameters:
		NONE

	Returns:
		ARRAY - List of sides that share cTab data with the player unit

	Example:
		_validSides = call cTab_fnc_getPlayerSides;
*/

private ["_return","_playerEncryptionKey"];

_return = [];
_playerEncryptionKey = call cTab_fnc_getPlayerEncryptionKey;

if (cTab_encryptionKey_west isEqualTo _playerEncryptionKey) then {_return pushBack west};
if (cTab_encryptionKey_east isEqualTo _playerEncryptionKey) then {_return pushBack east};
if (cTab_encryptionKey_guer isEqualTo _playerEncryptionKey) then {_return pushBack resistance};
if (cTab_encryptionKey_civ isEqualTo _playerEncryptionKey) then {_return pushBack civilian};

_return