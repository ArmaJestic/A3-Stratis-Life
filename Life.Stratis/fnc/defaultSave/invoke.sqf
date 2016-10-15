// A_defaultSave_fnc_invoke
// todo, split all into individual functions
// not major, defaultSave is just a placeholder until I feel like dealing with the database and the jni

#include "header.h"


params["_command",["_param0",null],["_param1",null],["_param2",null]];


//diag_log format['A_defaultSave_fnc_invoke %1: start', _this];

// if exitwith faster than switch apparently
// not used
// ["unloadPlayerVariables", _uid]
//if (_command == "unloadPlayerVariables") exitwith {};
// ["reloadPlayerVariables", _uid]
//if (_command == "reloadPlayerVariables") exitwith {};
// ["getenv", _key]
//if (_command == "getenv") exitwith {};
// ["setLocation", _location]
//if (_command == "setLocation") exitwith {};
// ["wipeAllPlayerVariables"]
//if (_command == "wipeAllPlayerVariables") exitwith {};
// ["wipePlayerVariables", _uid] 
//if (_command == "wipePlayerVariables") exitwith {};
if (
	(_command == "unloadPlayerVariables") ||
	{_command == "reloadPlayerVariables"} ||
	{_command == "getenv"} ||
	{_command == "setLocation"} ||
	{_command == "wipeAllPlayerVariables"} ||
	{_command == "wipePlayerVariables"}
)exitwith {
	//diag_log format['A_defaultSave_fnc_invoke %1: exit1', _this];
	null
};

if (UNDEFINED(_param0)) exitwith {
	//diag_log format['A_defaultSave_fnc_invoke %1: undef _param0, exit2', _this]; 
	null
};

// just check here first
// ["logThis", _text]
if (_command == "logThis") exitwith {
	//diag_log format['A_defaultSave_fnc_invoke %1: exit3', _this];
	private _text = _param0;
	diag_log format['A_defaultSave_fnc_invoke: logThis-%1', _text];
};

private["_return","_uid","_logic","_logicName"];
_return = null;
_uid = _param0;
_logic = [] call A_defaultSave_fnc_getLogic;
_logicName = [_uid] call A_defaultSave_fnc_getLogicName;

//diag_log format['A_defaultSave_fnc_invoke %1: logic-%2, logicName-%3', _this,_logic,_logicName];


if (_command == "getPlayerVariable") exitwith {
	// ["getPlayerVariable", _uid, _variable_name]
	//diag_log format['A_defaultSave_fnc_invoke %1: getPlayerVariable', _this];
	
	private["_variable_name","_logicVarName","_variable_value"];
	_variable_name = _param1;
	_logicVarName = [_logicName, _variable_name] call A_defaultSave_fnc_getLogicVarName;
	
	//diag_log format['A_defaultSave_fnc_invoke %1: variablename-%2, logicVarName-%3', _this, _variable_name, _logicVarName];
	
	_variable_value = _logic getVariable[_logicVarName, null];
	
	//diag_log format['A_defaultSave_fnc_invoke %1: variablevalue-%2', _this, _variable_value];
	
	_return = _variable_value;
	
	_return
};


// uses variables list
private["_list_varname","_list"];
_list_varname = format["%1_%2", _logicName, VAR_NAME_LIST];
_list = _logic getVariable[_list_varname,[]];

//diag_log format['A_defaultSave_fnc_invoke %1: list varname: %2, list: %3', _this,_list_varname,_list];

if (_command == "getPlayerVariablesCount") exitwith {
	// ["getPlayerVariablesCount", _uid]
	diag_log format['A_defaultSave_fnc_invoke %1: getPlayerVariablesCount', _this];
	
	private["_count"];
	_count = count _list;
	_return = str(_count);
	
	diag_log format['A_defaultSave_fnc_invoke %1: count-%2',_this,_count];
	
	_return
};
if (_command == "getPlayerVariableNameByIndex") exitwith {
	// ["getPlayerVariableNameByIndex", _uid, _index]
	//diag_log format['A_defaultSave_fnc_invoke %1: getPlayerVariableNameByIndex', _this];
	if (UNDEFINED(_param1)) exitwith {
		//diag_log format['A_defaultSave_fnc_invoke %1: getPlayerVariableNameByIndex undef _param1, exit', _this]; 
		null
	};
	
	private["_index","_variable_name"];
	_index = _param1;
	_variable_name = _list select _index;
	_return = _variable_name;
	
	//diag_log format['A_defaultSave_fnc_invoke %1: index-%2, variablename-%3',_this,_index,_variable_name];
	
	_return
};


if (UNDEFINED(_param1)) exitwith {
	//diag_log format['A_defaultSave_fnc_invoke %1: undef _param1, exit', _this]; 
	null
};
	
// uses given variable_name
private["_variable_name","_logicVarName"];
_variable_name = _param1;
_logicVarName = [_logicName, _variable_name] call A_defaultSave_fnc_getLogicVarName;

//diag_log format['A_defaultSave_fnc_invoke %1: variablename-%2, logicVarName-%3', _this, _variable_name, _logicVarName];

if (_command == "updatePlayerVariable") exitwith {
	// ["updatePlayerVariable", _uid, _variable_name, _variable_value]
	//diag_log format['A_defaultSave_fnc_invoke %1: updatePlayerVariable', _this];
	if (UNDEFINED(_param2)) exitwith {
		//diag_log format['A_defaultSave_fnc_invoke %1: updatePlayerVariable undef _param2, exit', _this]; 
		null
	};
	
	private["_variable_value","_new_value"];
	_variable_value = _param2;
	
	//diag_log format['A_defaultSave_fnc_invoke %1: variablevalue-%2', _this, _variable_value];
	
	if !(_variable_name in _list) then {
		//diag_log format['A_defaultSave_fnc_invoke %1: updatePlayerVariable, not in list', _this];
	
		_list pushBack _variable_name;
		_logic setVariable[_list_varname, _list];
	}else{
		//diag_log format['A_defaultSave_fnc_invoke %1: updatePlayerVariable, in list', _this];
	};
	
	// turn into string
	_new_value = format["%1", _variable_value];
	_logic setVariable[_logicVarName, _new_value];
	
	//diag_log format['A_defaultSave_fnc_invoke %1: variableTest, def test-varname:%2', _this,_logicVarName];
	private _variableTest = _logic getVariable[_logicVarName, null];
	if (DEFINED(_variableTest)) then {
		//diag_log format['A_defaultSave_fnc_invoke %1: variableTest, def-%2', _this,_variableTest];
	}else{
		//diag_log format['A_defaultSave_fnc_invoke %1: variableTest, undef', _this];
	};
	
	_return
};
if (_command == "removePlayerVariable") exitwith {
	// ["removePlayerVariable", _uid, _variable_name]
	//diag_log format['A_defaultSave_fnc_invoke %1: removePlayerVariable', _this];
	
	if (_variable_name in _list) then {
		//diag_log format['A_defaultSave_fnc_invoke %1: removePlayerVariable, in list', _this];
	
		_list = _list - [_variable_name];
		_logic setVariable[_list_varname, _list];
		_logic setVariable[_logicVarName, nil];
	}else{
		//diag_log format['A_defaultSave_fnc_invoke %1: removePlayerVariable, not in list', _this];
	};
	
	_return
};


//diag_log format['A_defaultSave_fnc_invoke %1: end', _this];