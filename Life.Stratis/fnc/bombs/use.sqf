// A_bombs_fnc_use

#include "..\..\includes\macro.h"


_item   = _this select 1;
    _anzahl = _this select 2;
        
    if (_item == "zeitzuenderbombe") then {
        if (!(createDialog "timebombconfig")) exitWith {
            hint "Dialog Error!";
        };
        sliderSetRange [1, A_main_var_zeitbombe_mintime, A_main_var_zeitbombe_maxtime];
        sliderSetSpeed [1, 1, 10];
        buttonSetAction [4, "[""plant"", ""zeitzuenderbombe"", sliderPosition 1] spawn A_SCRIPT_BOMBS; closedialog 0;"];
        while {ctrlVisible 1011} do {
            ctrlSetText [3, format[localize "STRS_inv_item_vehiclebomb_timebombconfig_sec", (round(sliderPosition 1))]];
            sleep 0.3;
        };
    };
            
    if (_item == "aktivierungsbombe") then {
        ["plant", "aktivierungsbombe"] spawn A_SCRIPT_BOMBS;
    };
            
    if (_item == "geschwindigkeitsbombe") then {
        if (!(createDialog "speedbombconfig")) exitWith {
                hint "Dialog Error!";
        };
        
        sliderSetRange [1, A_main_var_speedbomb_minspeed, A_main_var_speedbomb_maxspeed];
        sliderSetSpeed [1, 1, 10];
        sliderSetRange [8, A_main_var_speedbomb_mindur, A_main_var_speedbomb_maxdur];
        sliderSetSpeed [8, 1, 10];
        buttonSetAction [4, "[""plant"", ""geschwindigkeitsbombe"", sliderPosition 1, sliderPosition 8] spawn A_SCRIPT_BOMBS; closedialog 0;"];
        while {ctrlVisible 1010} do {
            ctrlSetText [3, format[localize "STRS_inv_item_vehiclebomb_speedbombconfig_kmh", (round(sliderPosition 1))]];
            ctrlSetText [10, format["%1 Sec.", (round(sliderPosition 8))]];
            sleep 0.3;
        };
    };
            
    if (_item == "fernzuenderbombe") then {
        ["plant", "fernzuenderbombe"] spawn A_SCRIPT_BOMBS;
    };
            
    if (_item == "fernzuender") then {
        if (!(createDialog "remotebomb_remote")) exitWith {hint "Dialog Error!";};
    };
