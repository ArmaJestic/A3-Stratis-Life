// A_defaultSave_fnc_invoke
private["_command","_return"];
_command = _this select 0;
_return = null;

diag_log format['A_defaultSave_fnc_invoke: command-%1', _command];

switch (_command) do {
	case "updatePlayerVariable": {
		// ["updatePlayerVariable", _uid, _variable_name, _variable_value]
		private["_uid", "_variable_name", "_variable_value", "_logic", "_list"];
		_uid = _this select 1;
		_variable_name = _this select 2;
		_variable_value = _this select 3;
		
		_logic = [_uid] call A_defaultSave_fnc_getLogic;
		_list = _logic getVariable["save_variable_array", []];
		if !(_variable_name in _list) {
			_list set[count _list, _variable_name];
			_logic setVariable["save_variable_array", _list];
		}
		_logic setVariable[_variable_name, _variable_value]];
	};
	case "getPlayerVariable": {
		// ["getPlayerVariable", _uid, _variable_name]
		private["_uid", "_variable_name", "_variable_value", "_logic"];
		_uid = _this select 1;
		_variable_name = _this select 2;
		
		_logic = [_uid] call A_defaultSave_fnc_getLogic;
		_variable_value = _logic getVariable[_variable_name, null];
		_return = _variable_value;
	}
	case "removePlayerVariable": {
		// ["removePlayerVariable", _uid, _variable_name]
		private["_uid", "_variable_name", "_logic", "_list"];
		_uid = _this select 1;
		_variable_name = _this select 2;
		
		_logic = [_uid] call A_defaultSave_fnc_getLogic;
		_list = _logic getVariable["save_variable_array", []];
		if (_variable_name in _list) {
			_list = _list - [_variable_name];
			_logic setVariable["save_variable_array", _list];
			_logic setVariable[_variable_name, null];
		}
	}
	case "getPlayerVariablesCount": {
		// ["getPlayerVariablesCount", _uid]
		private["_uid", "_logic", "_list", "_count"];
		_uid = _this select 1;
		
		_logic = [_uid] call A_defaultSave_fnc_getLogic;
		_list = _logic getVariable["save_variable_array", []];
		_count = count _list;
		_result = format["%1", _count];
	}
	case "getPlayerVariableNameByIndex": {
		// ["getPlayerVariableNameByIndex", _uid, _index]
		private["_uid", "_index", "_logic", "_list", "_variable_name"];
		_uid = _this select 1;
		_index = _this select 2;
		
		_logic = [_uid] call A_defaultSave_fnc_getLogic;
		_list = _logic getVariable["save_variable_array", []];
		_variable_name = _list select _index;
		_result = _variable_name;
	}
	case "wipePlayerVariables": {
		// ["wipePlayerVariables", _uid]
		private["_uid", "_logic_server", "_logic_list", "_logic_name", "_logic"];
		_uid = _this select 1;
		_logic_name = [_uid] call A_defaultSave_fnc_getLogicName;
		_logic_server = [] call A_defaultSave_fnc_getServerLogic;
		_logic_list = _logic_server getVariable["save_logics_array", []];
		_logic = [_uid] call A_defaultSave_fnc_getLogic;
		
		if !(isNull _logic) then {
			deleteVehicle _logic;
		}
		if (_logic_name in _logic_list) {
			_logic_list = _logic_list - [_logic_name];
			_logic_server setVariable["save_logics_array", _logic_list];
		}
	}
	case "wipeAllPlayerVariables": {
		// ["wipeAllPlayerVariables"]
		private["_logic_server", "_logic_list"];
		_logic_server = [] call A_defaultSave_fnc_getServerLogic;
		_logic_list = _logic_server getVariable["save_logics_array", []];
		
		{
			if !(isNull (missionNamespace getVariable[_x, objNull])) then {
				deleteVehicle _x;
			}
		} forEach _logic_list;
		_logic_server setVariable["save_logics_array", []];
	}
	case "unloadPlayerVariables": {
		// ["unloadPlayerVariables", _uid]
		// Nothing this has to worry about?
	}
	case "reloadPlayerVariables": {
		// ["reloadPlayerVariables", _uid]
		// Not used?
	}
	case "getenv": {
		// ["getenv", _key]
		// Not used?
	}
	case "setLocation": {
		// ["setLocation", _location]
		// Not used?
	}
	case "logThis": {
		// ["logThis", _text]
		private["_text"];
		_text = _this select 1;
		diag_log format['A_defaultSave_fnc_invoke: logThis-%1', _text];
	}
	default {
		diag_log format['A_defaultSave_fnc_invoke: default case'];
	};
};
_return
