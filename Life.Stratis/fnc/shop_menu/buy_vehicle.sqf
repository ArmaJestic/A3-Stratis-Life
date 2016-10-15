// A_shop_menu_fnc_buy_vehicle

#include "header.h"


params[["_data",null,[[]]]];
if UNDEFINED(_data) exitWith {null};

private _item = _data select INDEX_BUY_KEY;
private _item_name = _data select INDEX_BUY_NAME;
private _logic = objectFromNetId(_data select INDEX_BUY_LOGIC_NETID);
private _total_due = [(_data select INDEX_BUY_TOTAL_DUE)] call A_encoding_fnc_decode_number;
private _class = _data select INDEX_BUY_CLASS;
private _sleep_time = 5;

systemChat format["You bought a %1 for $%2. Please wait %3 seconds until the vehicle spawns.", _item_name, strM(_total_due), _sleep_time];
[_sleep_time] call A_shop_menu_fnc_set_busy;

[_sleep_time,[_logic,_class,_item],A_vehicle_fnc_create_shop] call A_frame_fnc_wait;