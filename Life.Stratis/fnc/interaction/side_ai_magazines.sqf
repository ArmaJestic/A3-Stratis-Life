// A_interaction_fnc_side_ai_magazines

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_side);
if (undefined(_side)) exitWith {[]};
if (typeName _side != "SIDE") exitWith {[]};

if (_side == west) exitWith { backup_cop_magazines };
if (_side == east) exitWith { backup_opf_magazines };
if (_side == resistance ) exitWith { backup_ins_magazines };

[]
