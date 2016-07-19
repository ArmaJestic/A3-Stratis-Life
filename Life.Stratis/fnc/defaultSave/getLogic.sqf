// A_defaultSave_fnc_getLogic
private["_uid","_logicName", "_logic"];
_uid = _this select 0;
_logicName = [_uid] call A_defaultSave_fnc_getLogicName;
_logic = objNull;

if ([_logicName] call A_defaultSave_fnc_logicExists) then {
	_logic = missionNamespace getVariable [_logicName, objNull];
}else{
	_logic = [_logicName] call A_defaultSave_fnc_createLogic;
}
	
_logic
