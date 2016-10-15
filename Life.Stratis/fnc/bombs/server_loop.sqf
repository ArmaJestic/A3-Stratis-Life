// A_bombs_fnc_server_loop

#include "..\..\includes\macro.h"
#define REMOVE_BOMB() A_bombs_var_serverbombarray set[_forEachIndex,null]; _update = true;


private _update = false;
{
	private _array = _x;
	_array params["_id","_vehicle","_name","_status","_settings"];

	if ((isNull _vehicle) || {!alive _vehicle}) then {
		REMOVE_BOMB()
	}else{
		switch (_name) do {
			case "fernzuenderbombe": {
				if (_settings select 0) exitwith { 
					_vehicle spawn A_bombs_fnc_spawn; 
				};
				if (_status == "defused") exitwith { 
					REMOVE_BOMB()
				};
			};
			case "zeitzuenderbombe": {
				if ((_settings select 0) < time) exitwith { 
					_vehicle spawn A_bombs_fnc_spawn; 
				};
				if (_status == "defused") exitwith { 
					REMOVE_BOMB()
				};
			};
			case "aktivierungsbombe": {
				if (!(_settings select 0)) exitwith {
					_bombhandler = _vehicle addEventHandler["engine", {_vehicle = _this select 0; if (isEngineOn _vehicle) then {_vehicle removeAllEventHandlers "engine"; _vehicle spawn A_bombs_fnc_spawn;};}];
				};
				if (_status == "defused") exitwith {
					REMOVE_BOMB()
					_vehicle removeAllEventHandlers "engine";
				};
			};
			case "geschwindigkeitsbombe": {
				private _active = (_settings select 1);
				private _speed  = speed _vehicle;
				if ((_active) and (_speed < (_settings select 0))) exitwith { 
					_vehicle spawn A_bombs_fnc_spawn; 
				};
				if (_status == "defused") exitwith {
					REMOVE_BOMB()
				};
				if ((!_active) && (_speed > (_settings select 0))) exitwith {
					_settings set[1, true];
					_newtime = time + (_settings select 2);
					_settings set[3, ((round(time))+(_settings select 2))];
					format["if (player in %1) then {player groupChat ""Watch out, the carbomb has been activated. You are not allowed to drive slower than %2 km/h!"";};", _vehicle, round(_settings select 0), (_settings select 2)] call A_broadcast_fnc_broadcast;
				};
				if (time > _newtime) exitwith {
					_array set[3, "defused"];
					format["if (player in %1) then {player groupChat localize ""STRS_inv_item_vehiclebomb_deactivated"";};", _vehicle] call A_broadcast_fnc_broadcast;
				};
			};
		};
	};
} forEach A_bombs_var_serverbombarray;

if (_update) then {
	A_bombs_var_serverbombarray = A_bombs_var_serverbombarray - [null];
	publicVariable "A_bombs_var_serverbombarray";
};