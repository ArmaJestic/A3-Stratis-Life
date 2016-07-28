// A_wbl_fnc_l_remove_all

#include "..\..\includes\macro.h"


private["_list_name", "_List_variable", "_List_pv_c"];

_list_name 	= _this select 0;

_List_variable 	= "";
_List_pv_c		= "";

{
	if ((_x select 0) == _list_name) then {
		_List_variable 		= _x select 1;
		_List_pv_c			= _x select 4;
	};
} forEach A_wbl_var_lists;

player groupchat "Clearing list...";

call compile format["%1 = [];", _List_variable];
call compile format["%1 = %2", _List_pv_c, _List_variable];

publicVariableServer _List_pv_c;	
player groupchat "Sent to server, please wait for lists to update";
