// A_interaction_fnc_gang_update_open_cbox

#include "header.h"


private["_gang"];
_gang = [selected_gang_id] call A_gang_fnc_lookup_id;
if (UNDEFINED(_gang)) exitWith {null};

private["_open"];
_open = _gang select GANG_INDEX_OPEN;

private["_text"];
_text = if (_open) then { format["[x] Gang open"] } else {format["[ ] Gang open"]};
ctrlSetText [202, _text];
