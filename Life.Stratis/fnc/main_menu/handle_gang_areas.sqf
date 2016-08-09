// A_main_menu_fnc_handle_gang_areas

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_title);
private["_list"];
_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call A_main_menu_fnc_right_setup;
lbClear (ctrlIDC _list);


{ if (true) then {
	private["_gang_area"];
	_gang_area = _x;
	
	private["_gang_area_name"];
	_gang_area_name = str(_gang_area);
	
	if ([_gang_area] call A_gang_fnc_area_neutral) then {
		_list lbAdd format["%1 - (Neutral)", _gang_area_name];
	}else{
		private["_gang_id"];
		_gang_id = [_gang_area] call A_gang_fnc_area_get_control;
		
		private["_gang"];
		_gang = [_gang_id] call A_gang_fnc_lookup_id;
		
		if (undefined(_gang)) then {
			_list lbAdd format["%1 - (Abandoned)", _gang_area_name];
		}else{
			private["_gang_name"];
			_A_gang_var_name = _gang select A_gang_var_name;
			_list lbAdd format["%1 - (%2)", _gang_area_name, _gang_name];
		};
	};
};} forEach A_main_var_gangareas;
