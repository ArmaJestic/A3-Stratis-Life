// A_interaction_fnc_gang_update_open_cbox

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


private["_gang"];
_gang = [selected_gang_id] call A_gang_fnc_lookup_id;
if (undefined(_gang)) exitWith {null};

private["_open"];
_open = _gang select A_gang_var_open;

private["_text"];
_text = if (_open) then { format["[x] Gang open"] } else {format["[ ] Gang open"]};
ctrlSetText [202, _text];
