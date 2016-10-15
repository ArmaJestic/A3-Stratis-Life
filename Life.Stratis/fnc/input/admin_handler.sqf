// A_input_fnc_admin_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


params["_disp","_key","_shift","_ctrl","_alt"];
private _handled = false;

if (!((_key == DIK_G) && {_ctrl} && {_shift} && {_alt})) exitWith {false};

systemChat format["Admin command!"];

//create the admin list if it does not exist
if (!(["admin_list"] call A_list_fnc_exists)) then {
	["admin_list", "Admin List"] call A_list_fnc_create;		
};

//add player to admin list if he is not in it
if (!(["admin_list", (getPlayerUID player)] call A_list_fnc_contains_key)) then {
	["admin_list", (getPlayerUID player), ""] call A_list_fnc_put_value;
};


systemChat format["Admin command!2"];

[] call compile preprocessFileLineNumbers "SL\editor.sqf"; 

true