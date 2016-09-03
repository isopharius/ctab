/*
	Author: Jiri Wainar
	Modified by: Gundy

	Description:
	Adds given value to pair array, stored under unique key.

	If value is found:
	a) both values are scalars: values are added and stored as a single scalar
	b) one or both values are array: values are added and stored as a single array
	c) anything else: an array is created and both values are stored there

	Remarks:
	Function by default modifies the input array. It returns the new value that has been added.

	Syntax:
	_pairs:array = [_pairs:array,_key:string,_value:number] call BIS_fnc_addToPairs;

	Example:
	[["apple",3],["pear",12]] = [[["apple",3],["pear",2]],"pear",10] call BIS_fnc_addToPairs;
	[["apple",1],["pear",2]] = [[["apple",3],["pear",2]],"apple",-2] call BIS_fnc_addToPairs;
	[["greetings",["Hello!","Hi!"]],["rudewords",""]] = [[["greetings","Hello!"],["rudewords",""]],"greetings","Hi!"] call BIS_fnc_addToPairs;
*/

#define SCALAR		(typeName 123)
#define ARRAY		(typeName [])

params [["_pairs",[],[[]]],["_key","",[""]],["_add",1]];
private ["_copy","_index","_value","_tValue","_tAdd","_return"];

_index  = -1;
_return = "";

{
	if (typeName _x != typeName []) exitWith
	{
		["Every item in the pair array must be an array!"] call BIS_fnc_error;
		_index = -2;
	};
	if (count _x  != 2) exitWith
	{
		["Pair array must contain exactly 2 items, key and value!"] call BIS_fnc_error;
		_index = -2;
	};
	if (isNil{_x select 0}) exitWith
	{
		["Key cannot be nil!"] call BIS_fnc_error;
		_index = -2;
	};
	if (typeName(_x select 0) != typeName "") exitWith
	{
		["Key must be a string!"] call BIS_fnc_error;
		_index = -2;
	};
	if (isNil{_x select 1}) exitWith
	{
		["Value cannot be nil!"] call BIS_fnc_error;
		_index = -2;
	};
	if (_key isEqualTo (_x select 0)) exitWith
	{
		_index = _forEachIndex;
		_value = _x select 1;
	};
}
forEach _pairs;

//error occured, exit
if (_index isEqualTo -2) exitWith {nil};

//key not found, add the new entry
if (_index isEqualTo -1) then
{
	_pairs pushBack [_key, _add];
	_return = _add;
}
//key found, add the value to existing entry
else
{
	call
	{
		_tValue = typeName _value;
		_tAdd = typeName _add;
		if ((_tValue isEqualTo "SCALAR" && {_tAdd isEqualTo "SCALAR"}) || {(_tValue isEqualTo "ARRAY" && {_tAdd isEqualTo "ARRAY"})}) exitWith
		{
			_return = _value + _add;
		};
		if (_tValue isEqualTo "ARRAY") exitWith
		{
			_return = _value + [_add];
		};
		if (_tAdd isEqualTo "ARRAY") then
		{
			_return = _add + [_value];
		} else {
			//none of the items are of array, so create one and store them there
			_return = _value + [_add];
		};
	};

	_pairs set [_index, [_key, _return]];
};

_return