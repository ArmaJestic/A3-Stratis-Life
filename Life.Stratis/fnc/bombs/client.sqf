// A_bombs_fnc_client

#include "..\..\includes\macro.h"


if (not(undefined(bombs_client_functions_defined))) exitWith {};
bombs_client_functions_defined = true;

    _a1=0; _a2=0; _a3=0; _a4=0; _a5=0; _v=0;
    while {true} do {
        _skipWait = false;
        for [{_i=0}, {_i < (count A_bombs_var_inv_localbombarray)}, {_i=_i+1}] do {
            _array    = (A_bombs_var_inv_localbombarray select _i);
            _id = _array select 0;
            _vehicle  = _array select 1;
            _item = _array select 2;
            _actionArr= _array select 3;
            
            if (isNull(_vehicle)) exitWith { 
                format["""%1"" call A_bombs_fnc_delete", _id] call A_broadcast_fnc_broadcast; _skipWait = true; 
            };
            
            if (not(alive(_vehicle)))  exitWith { 
                format["""%1"" call A_bombs_fnc_delete", _id] call A_broadcast_fnc_broadcast; _skipWait = true; 
            };
            
            if ( (vehicle player == _vehicle) and ((count _actionArr) == 0) ) then {
                _v = vehicle player;
                switch _item do {
                    case "fernzuenderbombe": {
                        _a1 = _v addAction [localize "STRS_inv_item_vehiclebomb_action_deactivate",  "noscript.sqf", format["[""config"", ""defuse"", ""%1"", ""%2""] spawn A_SCRIPT_BOMBS;", _item, _id ]]; 
                        _actionArr = _actionArr + [_a1];
                    };
                    case "zeitzuenderbombe": { 
                        _a1 = _v addAction [localize "STRS_inv_item_vehiclebomb_action_deactivate", "noscript.sqf",  format["[""config"", ""defuse"", ""%1"", ""%2""] spawn A_SCRIPT_BOMBS;", _item, _id ]];
                        _a2 = _v addAction [localize "STRS_inv_item_vehiclebomb_action_changetimer", "noscript.sqf", format["[""config"", ""Timer"",  ""%1"", ""%2""] spawn A_SCRIPT_BOMBS;", _item, _id ]];
                        _actionArr = _actionArr + [_a1, _a2];
                    };
                    case "aktivierungsbombe": { 
                        _a1 = _v addAction [localize "STRS_inv_item_vehiclebomb_action_deactivate", "noscript.sqf", format["[""config"", ""defuse"", ""%1"", ""%2""] spawn A_SCRIPT_BOMBS;", _item, _id ]];
                        _actionArr = _actionArr + [_a1];
                    };
                    
                    case "geschwindigkeitsbombe":  {
                        _a1 = _v addAction [localize "STRS_inv_item_vehiclebomb_action_deactivate", "noscript.sqf", format["[""config"", ""defuse"", ""%1"", ""%2""] spawn A_SCRIPT_BOMBS;", _item, _id ]];
                        _actionArr = _actionArr + [_a1];
                    };
                };
            };
            
            if (vehicle player != _vehicle) then {
                for [{_j=0}, {_j < (count _actionArr)}, {_j=_j+1}] do { _vehicle removeAction (_actionArr select _j); };
                _actionArr = [];
            };
            (A_bombs_var_inv_localbombarray select _i) set [3, _actionArr];
        };
        
        if (!_skipWait) then {
            sleep 3;
        };
    };
