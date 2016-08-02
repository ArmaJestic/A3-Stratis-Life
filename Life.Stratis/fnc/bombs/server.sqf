// A_bombs_fnc_server

#include "..\..\includes\macro.h"


_lastLength = 0;

while {true} do {
	_skipWait = false;
	for [{_i=0}, {_i < (count A_bombs_var_serverbombarray)}, {_i=_i+1}] do {
		_array    = (A_bombs_var_serverbombarray select _i);
		_id       = _array select 0;
		_vehicle  = _array select 1;
		_name     = _array select 2;
		_status   = _array select 3;
		_settings = _array select 4;

		if (isNull(_vehicle)) exitWith {
			format["""%1"" call A_bombs_fnc_delete", _id] call A_broadcast_fnc_broadcast;
			_skipWait = true;
		};

		if (!(alive(_vehicle)))  exitWith {
			format["""%1"" call A_bombs_fnc_delete", _id] call A_broadcast_fnc_broadcast;
			_skipWait = true;
		};

		switch (_name) do {
			case "fernzuenderbombe": {
				if (_settings select 0) then { 
					_vehicle spawn A_bombs_fnc_spawn; 
				};
				if (_status == "defused") then { 
					format["""%1"" call A_bombs_fnc_delete", _id] call A_broadcast_fnc_broadcast; 
				};
			};

			case "zeitzuenderbombe": {
				if (_settings select 0 < time) then { 
					_vehicle spawn A_bombs_fnc_spawn; 
				};
				if (_status == "defused") then { 
					format["""%1"" call A_bombs_fnc_delete", _id] call A_broadcast_fnc_broadcast; 
				};
			};

			case "aktivierungsbombe": {
				if (!(_settings select 0)) then {
					_bombhandler = _vehicle addEventHandler ["engine", { _vehicle = _this select 0;  if (isEngineOn _vehicle) then { _vehicle removeAllEventHandlers "engine"; _vehicle spawn A_bombs_fnc_spawn; }; }];
				};

				if (_status == "defused") then {
					format["""%1"" call A_bombs_fnc_delete", _id] call A_broadcast_fnc_broadcast;
					 _vehicle removeAllEventHandlers "engine";
				};
			};

			case "geschwindigkeitsbombe": {
				_active = (_settings select 1);
				_speed  = speed _vehicle;
				if ((_active) and (_speed < (_settings select 0))) then { 
					_vehicle spawn A_bombs_fnc_spawn; 
				};
					
				if (_status == "defused") then { 
					format["""%1"" call A_bombs_fnc_delete", _id] call A_broadcast_fnc_broadcast; 
				};
				
				if ( (!_active) and (_speed > (_settings select 0)) ) then {
					_settings set [1, true];
					_newtime = time + (_settings select 2);
					_settings set [3, ((round(time))+(_settings select 2))];
					format["if (player in %1) then {player groupChat ""Watch out, the carbomb has been activated. You are not allowed to drive slower than %2 km/h!"";};", _vehicle, round(_settings select 0), (_settings select 2)] call A_broadcast_fnc_broadcast;
				};
				
				if (time > _newtime) then {
					_array set [3, "defused"];
					format["if (player in %1) then {player groupChat localize ""STRS_inv_item_vehiclebomb_deactivated"";};", _vehicle] call A_broadcast_fnc_broadcast;
				};
			};
		};
	};

	if ( (A_bombs_var_getarr) ) then {
		_lastLength = count A_bombs_var_serverbombarray;
		A_bombs_var_getarr = false;
		publicVariable "A_bombs_var_serverbombarray";
	};
	
	if (!_skipWait) then {
		sleep 1;
	};
};
