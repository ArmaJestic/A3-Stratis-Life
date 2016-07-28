// A_bombs_fnc_config

#include "..\..\includes\macro.h"


    _art  = _this select 1;
    _name = _this select 2;
    _id   = _this select 3;
    if (!(_id call A_bombs_fnc_idexists)) exitWith {player groupChat localize "STRS_inv_item_vehiclebomb_notexist,";};
    
    switch _name do {
        case "fernzuenderbombe": {
            if (_art == "defuse") then {
                format["""%1"" call A_bombs_fnc_delete", _id] call A_broadcast_fnc_broadcast;
                [player, _name, 1] call A_inventory_fnc_add_item;
                player groupChat localize "STRS_inv_item_vehiclebomb_defused";
            };
            if (_art == "activate") then {
                format["if (isServer) then {[""%1"", [%2]] call A_bombs_fnc_edit;};", _id, true] call A_broadcast_fnc_broadcast;
            };
        };
        
        case "zeitzuenderbombe": {
            if (_art == "defuse") then {
                format["""%1"" call A_bombs_fnc_delete", _id] call A_broadcast_fnc_broadcast;
                [player, _name, 1] call A_inventory_fnc_add_item;
                player groupChat localize "STRS_inv_item_vehiclebomb_defused";
            };
            
            if (_art == "timer") exitWith {
                if (!(createDialog "timebombconfig")) exitWith {
                    hint "Dialog Error!";
                };
            
                _sliderpos = 0;ctrlSetText [4, localize "STRS_inv_item_vehiclebomb_changetimer"];
                sliderSetRange [1, A_main_var_zeitbombe_mintime, A_main_var_zeitbombe_maxtime];sliderSetSpeed [1, 1, 10];
                buttonSetAction [4, "zeitbombencounterchanged = 1; closedialog 0;"];
                zeitbombencounterchanged = 0;
                while {ctrlVisible 2} do {
                    _sliderpos = round(sliderPosition 1);
                    ctrlSetText [3, format[localize "STRS_inv_item_vehiclebomb_sec", _sliderpos]];
                    sleep 0.3;
                };
                
                if (zeitbombencounterchanged == 1) then {
                    format["if (isServer) then {[""%1"", [%2]] call A_bombs_fnc_edit;};", _id, (time+_sliderpos)] call A_broadcast_fnc_broadcast;
				player groupChat format [localize "STRS_inv_item_vehiclebomb_changed", _sliderpos];
                };
            };
        };
        case "aktivierungsbombe": {
            if (_art == "defuse") then {
                format["""%1"" call A_bombs_fnc_delete", _id] call A_broadcast_fnc_broadcast;
			[player, _name, 1] call A_inventory_fnc_add_item;player groupChat localize "STRS_inv_item_vehiclebomb_defused";
            };
        };
        case "geschwindigkeitsbombe": {
            if (_art == "defuse") then {
                format["""%1"" call A_bombs_fnc_delete", _id] call A_broadcast_fnc_broadcast;
			[player, _name, 1] call A_inventory_fnc_add_item;player groupChat localize "STRS_inv_item_vehiclebomb_defused";
            };
        };
    };
