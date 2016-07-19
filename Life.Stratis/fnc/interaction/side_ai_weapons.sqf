// A_interaction_fnc_side_ai_weapons

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


ARGV(0,_side);
if (undefined(_side)) exitWith {[]};
if (typeName _side != "SIDE") exitWith {[]};

if (_side == west) exitWith { backup_cop_weapons };
if (_side == east) exitWith { backup_opf_weapons };
if (_side == resistance ) exitWith { backup_ins_weapons };
[]
