// A_interaction_fnc_side_ai_weapons

#include "header.h"


ARGV(0,_side);
if (UNDEFINED(_side)) exitWith {[]};
if (typeName _side != "SIDE") exitWith {[]};

if (_side == west) exitWith { A_main_var_backup_cop_weapons };
if (_side == east) exitWith { A_main_var_backup_opf_weapons };
if (_side == resistance ) exitWith { A_main_var_backup_ins_weapons };
[]
