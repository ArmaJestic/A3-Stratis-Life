// A_factory_fnc_update_dequeue_item

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


call A_factory_fnc_update_production_stats;
private["_messages"];
_messages = call A_factory_fnc_validate_dequeue_item;
[_messages] call A_factory_fnc_update_status_fields;
