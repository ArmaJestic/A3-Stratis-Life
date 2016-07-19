// A_interaction_fnc_gang_create_menu

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


//player groupChat format["A_interaction_fnc_gang_create_menu"];

if (not(createDialog "gilde_gruenden")) exitWith {
	player groupChat format["ERROR: could not create gang creation dialog"];
};

private["_info"];
_info = format["Note: Gang creation fee is $%1.", strM(gangcreatecost)] +
		format["If you leave and rejoin the game, you must rejoin the gang (there is no join fee)."] +
		format["The gang will be deleted after %1 minutes if there are no members in the gang.", round(gangdeltime/60)];
		
ctrlSetText[5, _info];
