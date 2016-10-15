// A_inventory_fnc_remove_illegal

#include "header.h"


ARGV(0,_object);

private["_inv"];
_inv = [_object] call A_player_fnc_get_inventory;

{
	private["_item_entry", "_item", "_infos", "_isItem"];
	_item_entry = _x;
	_item = _item_entry select 0;
	_infos = _item call A_inventory_fnc_get_item_array;
	_isItem = ((_infos call A_inventory_fnc_get_item_type) == "Item");
	if (_isItem) then { if (_item call A_inventory_fnc_get_item_illegal) then {
		[_object, _item, 0] call A_inventory_fnc_set_item_amount;
	};};
} foreach _inv;	 

{
	if (!(_x == "Laserdesignator" || _x =="Binocular_Vector" || _x =="NVGoggles"  || _x =="Binocular" || _x =="itemmap" || _x =="itemgps" ||
		_x =="itemradio" || _x =="ItemCompass" || _x =="ItemWatch") ) then {
		_object removeweapon _x;
	};
} foreach weapons _object;

{ _object removemagazines _x;} foreach magazines _object;	
