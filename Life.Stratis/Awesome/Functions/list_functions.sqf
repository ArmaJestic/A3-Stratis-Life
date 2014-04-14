#include "macro.h"
if (not(undefined(list_functions_defined))) exitWith {null};

list_id = 0;
list_name = 1;
list_keys = 2;
list_values = 3;

list_exists = {
	ARGV(0,_list_id);
	if (undefined(_list_id)) exitWith {false};
	if (typeName _list_id != "STRING") exitWith {false};
	
	private["_list"];
	_list = [_list_id] call server_get_array;
	
	if ((count _list) == 0) exitWith {false};
	
	(true)
};

list_data = {
	ARGV(0,_list_id);
	if (undefined(_list_id)) exitWith {null};
	if (typeName _list_id != "STRING") exitWith {null};
	if (_list_id == "") exitWith {null};
	
	private["_data"];
	_data = [_list_id] call server_get_array;
	if ((count _data) == 0) exitWith {null};
	(_data)
};

list_create = {
	//player groupChat format["list_create %1", _this];
	ARGV(0,_list_id);
	ARGV(1,_list_name);
	
	if (undefined(_list_id)) exitWith {null};
	if (typeName _list_id != "STRING") exitWith {null};
	if (undefined(_list_name)) exitWith {null};
	if (typeName _list_name != "STRING") exitWith {null};
	
	if ([_list_id] call list_exists) exitWith {null};
	private["_data"];
	_data = [];
	_data set [list_id, _list_id];
	_data set [list_name, _list_name];
	_data set [list_keys, []];
	_data set [list_values, []];
	[_list_id, _data] call server_set_array;
};

list_put_value = {
	//player groupChat format["list_put_value %1", _this];
	ARGV(0,_list_id);
	ARGV(1,_key);
	ARGV(2,_value);
	
	if (undefined(_list_id)) exitWith {null};
	if (typeName _list_id != "STRING") exitWith {null};
	if (undefined(_key)) exitWith {null};
	if (typeName _key != "STRING") exitWith {null};
	
	private["_data"];
	_data = [_list_id] call list_data;
	if (undefined(_data)) exitWith {null};
	
	private["_keys", "_values"];
	_keys = _data select list_keys;
	_values = _data select list_values;
	
	private["_index"];
	_index = _keys find _key;
	_index = if (_index ==  -1) then {count(_keys)} else {_index};
	_keys set [_index, _key];
	_values set [_index, _value];
	
	_data set [list_keys, _keys];
	_data set [list_values, _values];
	
	[_list_id, _data, false] call server_set_array_checked;
};

list_get_value = {
	ARGV(0,_list_id);
	ARGV(1,_key);
	
	if (undefined(_list_id)) exitWith {null};
	if (typeName _list_id != "STRING") exitWith {null};
	if (undefined(_key)) exitWith {null};
	if (typeName _key != "STRING") exitWith {null};
	
	private["_data"];
	_data = [_list_id] call list_data;
	if (undefined(_data)) exitWith {null};
	
	private["_keys", "_values"];
	_keys = _data select list_keys;
	_values = _data select list_values;
	
	private["_index"];
	_index = _keys find _key;
	if (_index == -1) exitWith {null};
	
	private["_value"];
	if (_index >= count(_values)) exitWith {null};
	
	_value = _values select _index;
	
	(_value)
};

list_remove_key = {
	ARGV(0,_list_id);
	ARGV(1,_key);
	
	if (undefined(_list_id)) exitWith {null};
	if (typeName _list_id != "STRING") exitWith {null};
	if (undefined(_key)) exitWith {null};
	if (typeName _key != "STRING") exitWith {null};
	
	private["_data"];
	_data = [_list_id] call list_data;
	if (undefined(_data)) exitWith {null};
	
	private["_keys", "_values"];
	_keys = _data select list_keys;
	_values = _data select list_values;
	
	private["_index"];
	_index = _keys find _key;
	if (_index == -1) exitWith {null};
	
	_values set [_index, _key];
	
	_keys = _keys - [_key];
	_values = _values - [_key];
	
	_data set [list_keys, _keys];
	_data set [list_values, _values];
	
	[_list_id,  _data, false] call server_set_array_checked;
};

list_contains_key = {
	ARGV(0,_list_id);
	ARGV(1,_key);
	
	if (undefined(_list_id)) exitWith {false};
	if (typeName _list_id != "STRING") exitWith {false};
	if (undefined(_key)) exitWith {false};
	if (typeName _key != "STRING") exitWIth {false};
	
	private["_data"];
	_data = [_list_id] call list_data;
	if (undefined(_data)) exitWith {false};
	
	private["_keys", "_values"];
	_keys = _data select list_keys;
	
	private["_index"];
	_index = _keys find _key;
	if (_index == -1) exitWith {false};
	
	(true)
};

//player groupChat format["list functions defined"];
list_functions_defined = true;