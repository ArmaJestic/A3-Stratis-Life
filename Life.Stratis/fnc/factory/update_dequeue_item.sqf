// A_factory_fnc_update_dequeue_item

#include "header.h"


call A_factory_fnc_update_production_stats;
private _messages = call A_factory_fnc_validate_dequeue_item;
[_messages] call A_factory_fnc_update_status_fields;