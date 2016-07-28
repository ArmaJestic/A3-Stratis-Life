// A_wbl_fnc_l_remove

#include "..\..\includes\macro.h"


private["_list_name", "_uid", "_List_variable", "_List_pv_c"];

_list_name 	= _this select 0;
_uid		= _this select 1;

if (_uid == "") exitwith {
	player groupchat "ERROR: Please reselect the list item then retry the removal button";
};

_List_variable 	= "";
_List_pv_c		= "";

{
	if ((_x select 0) == _list_name) then {
		_List_variable 		= _x select 1;
		_List_pv_c			= _x select 4;
	};
} forEach A_wbl_var_lists;

if ((_uid in (call compile _List_variable))	) then {
	player groupchat "Removing from list...";

	call compile format["%1 = %1 - [""%2""];", _List_variable, _uid];
	call compile format["%1 = %2", _List_pv_c, _List_variable];
	
	publicVariableServer _List_pv_c;
	
	player groupchat "Sent to server, please wait for lists to update";
} else {
	player groupchat "ERROR: selected not in list";
};
