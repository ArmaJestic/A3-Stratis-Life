// A_defaultSave_fnc_createLogic
private["_logicName", "_logic"];
_logicName = _this select 0;
_logic = objNull;
	
if ([_logicName] call A_defaultSave_fnc_logicExists) then {
	diag_log format['A_defaultSave_fnc_createLogic: logic-%1, exists', _logicName];
	_logic = missionNamespace getVariable [_logicName, objNull];
}else{
	_logic = (group server) createUnit ["Logic", (getPosATL server), [], 0, "NONE"];
	_logic setVehicleVarName _logicName;
	missionNamespace setVariable[_logicName, _logic];
	_logic = missionNamespace getvariable[_logicName, objNull];
	
	_logic setVariable["save_variable_array", []];
	
	private["_serverName"];
	_serverName = ["server"] call A_defaultSave_fnc_getLogicName;
	if (_logicName == _serverName) then {
		_logic setVariable["save_logics_array", []];
	}else{
		private["_server_logic", "_server_list"];
		_server_logic = objNull;
		if !([_serverName] call A_defaultSave_fnc_logicExists) then {
			_server_logic = [_serverName] call A_defaultSave_fnc_createLogic
		}else{
			_server_logic = [] call A_defaultSave_fnc_getServerLogic;
		};
		_server_list = _server_logic getVariable["save_logics_array", []];
		_server_list set[count _server_list, _logicName];
		_server_logic setVariable["save_logics_array", _server_list];
	};
};
	
_logic
