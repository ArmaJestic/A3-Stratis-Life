// A_wbl_fnc_dialog_init

#include "..\..\includes\macro.h"


private
[
	"_DFML", 
	"_DFML_LIST1", "_DFML_LIST2", "_DFML_LIST3",
	"_DFML_BUTTON_B_1", "_DFML_BUTTON_B_2", "_DFML_BUTTON_B_3",
	"_DFML_BUTTON_W_1", "_DFML_BUTTON_W_2", "_DFML_BUTTON_W_3",
	"_DFML_TITLE_1", "_DFML_TITLE_2", "_DFML_TITLE_3", "_DFML_TITLE_1_DESC", "_DFML_TITLE_2_DESC", "_DFML_TITLE_3_DESC", 
	"_list_name", "_array", "_whiteList", "_blackList", "_list_choice_num",
	"_uid", "_whiteList_active", "_blackList_active",
	"_type_num", "_type_name", "_index",
	"_playerList_update", "_whiteList_update", "_blackList_update",
	"_playerList_array_DFML", "_whiteList_array_DFML", "_blackList_array_DFML",
	"_playerList_array_DFML_T", "_whiteList_array_DFML_T", "_blackList_array_DFML_T",
	"_whiteList_variable", "_blackList_variable",
	"_i"
];

if (!(createDialog "white_black_list")) exitWith {hint "Dialog Error!";};

disableSerialization;

_DFML = findDisplay 3005;

_DFML_LIST1 		= (_DFML displayCtrl 1500);
_DFML_LIST2 		= (_DFML displayCtrl 1501);
_DFML_LIST3 		= (_DFML displayCtrl 1502);

_DFML_BUTTON_B_1	= (_DFML displayCtrl 1700);
_DFML_BUTTON_B_2	= (_DFML displayCtrl 1701);
_DFML_BUTTON_B_3	= (_DFML displayCtrl 1705);
_DFML_BUTTON_B_4	= (_DFML displayCtrl 1707);

_DFML_BUTTON_W_1	= (_DFML displayCtrl 1702);
_DFML_BUTTON_W_2	= (_DFML displayCtrl 1703);
_DFML_BUTTON_W_3	= (_DFML displayCtrl 1706);
_DFML_BUTTON_W_4	= (_DFML displayCtrl 1708);

_DFML_TITLE_1		= (_DFML displayCtrl 1000);
_DFML_TITLE_2		= (_DFML displayCtrl 1001);
_DFML_TITLE_3		= (_DFML displayCtrl 1002);

_DFML_TITLE_1_DESC	= (_DFML displayCtrl 1003);
_DFML_TITLE_2_DESC	= (_DFML displayCtrl 1004);
_DFML_TITLE_3_DESC	= (_DFML displayCtrl 1005);

_list_name		= _this select 0;
_array			= [];

_playerList_array_DFML 	= [];
_whiteList_array_DFML	= [];
_blackList_array_DFML 	= [];

_playerList_array_DFML_T 	= [];
_whiteList_array_DFML_T		= [];
_blackList_array_DFML_T 	= [];

{
	if ((_x select 0) == _list_name) then {
			_array = _x;
			_whiteList		= _array select 1;
			_blackList		= _array select 2;
			_list_choice_num	= _array select 3;
		};
} forEach A_wbl_var_lists_all;

{
	if ((_x select 0) == _whiteList) then {
		_whiteList_variable 	= _x select 1;
	};
		
	if ((_x select 0) == _blackList) then {
		_blackList_variable 	= _x select 1;
	};
} forEach A_wbl_var_lists;

_DFML_BUTTON_B_1 ctrlSetText format["Add to Black List"];
_DFML_BUTTON_B_2 ctrlSetText format["Remove from Black List"];
_DFML_BUTTON_B_3 ctrlSetText format["Remove selected Player from BL"];
_DFML_BUTTON_B_4 ctrlSetText format["Clear Black List"];

_DFML_BUTTON_W_1 ctrlSetText format["Add to White List"];
_DFML_BUTTON_W_2 ctrlSetText format["Remove from White List"];
_DFML_BUTTON_W_3 ctrlSetText format["Remove selected Player from WL"];
_DFML_BUTTON_W_4 ctrlSetText format["Clear White List"];

_whiteList_active = "";
_blackList_active = "";

if (_list_choice_num == 1) then {
	_whiteList_active = "Active";
} else {
	_whiteList_active = "In-Active";
	
	_DFML_BUTTON_W_1 ctrlEnable false;
	_DFML_BUTTON_W_2 ctrlEnable false;
	_DFML_BUTTON_W_3 ctrlEnable false;
	_DFML_BUTTON_W_4 ctrlEnable false;
};

if (_list_choice_num == 2) then {
	_blackList_active = "Active";
} else {
	_blackList_active = "In-Active";
	
	_DFML_BUTTON_B_1 ctrlEnable false;
	_DFML_BUTTON_B_2 ctrlEnable false;
	_DFML_BUTTON_B_3 ctrlEnable false;
	_DFML_BUTTON_B_4 ctrlEnable false;
};

_DFML_TITLE_1 ctrlSetText format["White List - %1", _whiteList_active];
_DFML_TITLE_2 ctrlSetText format["Black List - %1", _blackList_active];
_DFML_TITLE_3 ctrlSetText format["Player List"];

if (A_wbl_var_isadmin) then {
	_DFML_TITLE_1_DESC ctrlSetText format["UID		-		TYPE"];
	_DFML_TITLE_2_DESC ctrlSetText format["UID		-		TYPE"];
	_DFML_TITLE_3_DESC ctrlSetText format["UID	-	NAME	-	SLOT	- In White List?	-	In Black List?		-		In Admin List?		-		In Donator List?"];
} else {
	_DFML_TITLE_1_DESC ctrlSetText format["UID"];
	_DFML_TITLE_2_DESC ctrlSetText format["UID"];
	_DFML_TITLE_3_DESC ctrlSetText format["UID	-	NAME	-	SLOT	- In White List?	-	In Black List?"];
};

_playerList_update	= false;
_whiteList_update = false;
_blackList_update = false;

while {dialog} do {
	_DFML_BUTTON_B_1 buttonSetAction format["[""%1"", ""%2""] call %3;", _blackList, (_DFML_LIST3 lbData (lbCurSel _DFML_LIST3)), A_wbl_fnc_l_add];
	_DFML_BUTTON_B_2 buttonSetAction format["[""%1"", ""%2""] call %3;", _blackList, (_DFML_LIST2 lbData (lbCurSel _DFML_LIST2)), A_wbl_fnc_l_remove];
	_DFML_BUTTON_B_3 buttonSetAction format["[""%1"", ""%2""] call %3;", _blackList, (_DFML_LIST3 lbData (lbCurSel _DFML_LIST3)), A_wbl_fnc_l_remove];
	_DFML_BUTTON_B_4 buttonSetAction format["[""%1""] call %2;", _blackList, A_wbl_fnc_l_remove_all];
	
	_DFML_BUTTON_W_1 buttonSetAction format["[""%1"", ""%2""] call %3;", _whiteList, (_DFML_LIST3 lbData (lbCurSel _DFML_LIST3)), A_wbl_fnc_l_add];
	_DFML_BUTTON_W_2 buttonSetAction format["[""%1"", ""%2""] call %3;", _whiteList, (_DFML_LIST1 lbData (lbCurSel _DFML_LIST1)), A_wbl_fnc_l_remove];
	_DFML_BUTTON_W_3 buttonSetAction format["[""%1"", ""%2""] call %3;", _whiteList, (_DFML_LIST3 lbData (lbCurSel _DFML_LIST3)), A_wbl_fnc_l_remove];
	_DFML_BUTTON_W_4 buttonSetAction format["[""%1""] call %2;", _whiteList, A_wbl_fnc_l_remove_all];
	
	_playerList_array_DFML_T = [];
	{
		if (isPlayer _x) then {
			_uid	= (getPlayerUID _x);
			_playerList_array_DFML_T set[(count _playerList_array_DFML_T), _uid];
		};
	} forEach allUnits;
	
	if ((count _playerList_array_DFML) != (count _playerList_array_DFML_T)	) then {
		_playerList_update = true;
	} else {
		_i = 0;
		{
			if (	(_x) != (_playerList_array_DFML_T select _i)	) then {
				_playerList_update = true;
			};
			_i = _i + 1;
		} forEach _playerList_array_DFML;
	};
	
	if (_playerList_update) then {
		player groupchat format['PLAYERLIST UPDATING'];
		_playerList_array_DFML = [];
		
		lbClear _DFML_LIST3;
		
		{
			if ([_x] call A_player_fnc_human) then {
				private["_uid"];
				_uid = (getPlayerUID _x);
				
				if (A_wbl_var_isadmin) then {
					_index = _DFML_LIST3 lbAdd 
					(

						format[
							"%1 - %2 - %3 - %4 - %5 - %6 - %7", 
							_uid, 
							(name _x), 
							(_x),
							(call compile format["""%1"" in %2;", _uid, _whiteList_variable]), 
							(call compile format["""%1"" in %2;", _uid, _blackList_variable]),
							(_uid in A_wbl_var_a_list_admins), (_uid in A_wbl_var_a_list_donators)
						  ]
					);
				} 
				else {
					_index	= _DFML_LIST3 lbAdd 
					(
						format[
							"%1	-	%2	-	%3	-	%4	-	%5", 
							_uid, 
							(name _x), 
							(_x), 
							(call compile format["""%1"" in %2;", _uid, _whiteList_variable]), 
							(call compile format["""%1"" in %2;", _uid, _blackList_variable])
						]
					);
				};
				
				_DFML_LIST3 lbSetData [_index, (_uid)];
				_playerList_array_DFML set [(count _playerList_array_DFML), _uid];
			};
		} forEach allUnits;
		
		_playerList_update = false;
		
		player groupchat format['PLAYERLIST UPDATED'];
	};

	_whiteList_array_DFML_T	= call compile _whiteList_variable;
	
	if ((count _whiteList_array_DFML) != (count _whiteList_array_DFML_T)	) then {
		_whiteList_update = true;
	} else {
		_i = 0;
		{
			if ((_x) != (_whiteList_array_DFML_T select _i)	) then {
				_whiteList_update = true;
			};
			_i = _i + 1;
		} forEach _whiteList_array_DFML;
	};
	
	if (_whiteList_update) then {
		player groupchat format['WHITELIST UPDATING'];
		_whiteList_array_DFML = call compile _whiteList_variable;
		_DFML_LIST1 lbSetCurSel 0;

		lbClear _DFML_LIST1;
		{
			_type_num	= [_x] call A_wbl_fnc_gettype_num;
			_type_name	= [_type_num] call A_wbl_fnc_gettype_name;
			
			if (A_wbl_var_isadmin) then {
					_index	= _DFML_LIST1 lbAdd (format["%1		-		%2", (_x), (_type_name)]);
				} else {
					_index	= _DFML_LIST1 lbAdd (format["%1", (_x), (_type_name)]);
				};
				
			_DFML_LIST1 lbSetData [_index, (_x)];
		} forEach (_whiteList_array_DFML);
			
		_whiteList_update = false;
		
		_DFML_LIST1 lbSetCurSel 0;
		
		player groupchat format['WHITELIST UPDATED'];
	};
	
	_blackList_array_DFML_T	= call compile _blackList_variable;
	
	if ((count _blackList_array_DFML) != (count _blackList_array_DFML_T)	) then {
		_blackList_update = true;
	} else {
		_i = 0;
		{
			if (	(_x) != (_blackList_array_DFML_T select _i)	) then {
					_blackList_update = true;
				};
			_i = _i + 1;
		} forEach _blackList_array_DFML;
	};
	
	if (_blackList_update) then {
		player groupchat format['BLACKLIST UPDATING'];
		_blackList_array_DFML = call compile _blackList_variable;
		_DFML_LIST2 lbSetCurSel 0;
			
		lbClear _DFML_LIST2;
		{
			_type_num	= [_x] call A_wbl_fnc_gettype_num;
			_type_name	= [_type_num] call A_wbl_fnc_gettype_name;
			
			if (A_wbl_var_isadmin) then {
					_index	= _DFML_LIST2 lbAdd (format["%1		-		%2", (_x), (_type_name)]);
				} else {
					_index	= _DFML_LIST2 lbAdd (format["%1", (_x), (_type_name)]);
				};
			
			_DFML_LIST2 lbSetData [_index, (_x)];
		} forEach (_blackList_array_DFML);
			
		_blackList_update = false;
		
		_DFML_LIST2 lbSetCurSel 0;
		
		player groupchat format['BLACKLIST UPDATED'];
	};
	sleep 5;
};
