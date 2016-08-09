// A_vehicle_fnc_interact_vehicle_information

#include "..\..\includes\macro.h"


ARGV(0,_this);
ARGV(0,_player);
ARGV(1,_vehicle);

if (!([_player, _vehicle] call A_vehicle_fnc_information_available)) exitWith {};

private["_class", "_driver", "_picture", "_name", "_tag"];
_class = typeOf _vehicle;
_driver = driver _vehicle;
_driver = if (isNull _driver) then {"None"} else {format["%1-%2", _driver, (name _driver)]};
_picture = [_class] call A_misc_fnc_generic_picture_path;
_name = [_class] call A_misc_fnc_generic_display_name;
private["_max_name_len"];
_max_name_len = 17;
_tag = str(_vehicle);
_tag = if (([_tag] call A_misc_fnc_strlen) > _max_name_len) then { ([_tag, 0, _max_name_len] call A_misc_fnc_substr) + "..."} else {_tag};

private["_text"];
_text = "";
{
	private["_entry", "_label", "_value"];
	_entry = _x;
	_label = _entry select 0;
	_value = _entry  select 1;
	_text = _text + "<t align='left' font='PuristaMedium' size='1'>" + _label + "</t><t align='left' font='PuristaMedium'>" + _value + "</t><br />";
}forEach(
	[["    Name:      ", _tag],
	 ["    Direction:   ", str(round(getdir _vehicle)) + " degrees"],
	 ["    Altitude:    ", str(round(getposASL _vehicle select 2)) + " meter(s) ASL"],
	 ["    Driver:      ", _driver],
	 ["    Seats:      ", str((_vehicle emptyPositions "cargo")+(_vehicle emptyPositions "driver")) + " seat(s)"],
	 ["    Size:       ", str(round((sizeOf _class)*10)/10) + " meter(s)"]
	]);

_text = format["<t align='center' font='PuristaMedium' size='1.4' >Vehicle Information</t><br /><img image='%1' size='2.8'   /><br /><t  align='center'>(%2)</t>", _picture, _name] + "<br /><br />" + _text;
hint parseText _text;
