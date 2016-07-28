// A_input_fnc_admin_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


//player groupChat format["A_input_fnc_admin_handler %1", _this];
private["_player"];
_player = player;

private["_key", "_shift", "_ctrl", "_alt"];
_key = _this select 1;
_shift = _this select 2;
_ctrl = _this select 3;
_alt = _this select 4;

if (not((_key == 22) && (_ctrl) && (_shift) && (_alt))) exitWith {false};
private["_handled"];

server globalChat format["Admin command!"];
//create the admin list if it does not exist
if (not(["admin_list"] call A_list_fnc_exists)) then {
	["admin_list", "Admin List"] call A_list_fnc_create;		
};

//add player to admin list if he is not in it
if (not(["admin_list", (getPlayerUID _player)] call A_list_fnc_contains_key)) then {
	["admin_list", (getPlayerUID _player), ""] call A_list_fnc_put_value;
};


server globalChat format["Admin command!2"];

call compile preprocessFileLineNumbers "SL\editor.sqf"; 

true
