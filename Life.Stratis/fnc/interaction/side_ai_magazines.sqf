// A_interaction_fnc_side_ai_magazines

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_side);
if (undefined(_side)) exitWith {[]};
if (typeName _side != "SIDE") exitWith {[]};

if (_side == west) exitWith { A_main_var_backup_cop_magazines };
if (_side == east) exitWith { A_main_var_backup_opf_magazines };
if (_side == resistance ) exitWith { A_main_var_backup_ins_magazines };

[]
