// A_factory_fnc_update_status_fields

#include "header.h"


ARGV(0,_messages);
if (UNDEFINED(_messages)) exitWith {null};
if (typeName _messages != "ARRAY") exitWith {null};
if (count(_messages) != 2) exitWith {null};

private["_message1", "_message2"];
_message1 = _messages select 0;
_message2 = _messages select 1;

ctrlSetText [factory_status_field1_idc, _message1];
ctrlSetText [factory_status_field2_idc, _message2];
