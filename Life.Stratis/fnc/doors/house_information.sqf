// A_doors_fnc_house_information

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_this);
ARGV(0,_object);

private["_owner_uid"];
_owner_uid = [_object] call A_doors_fnc_house_owner_uid;
if (undefined(_owner_uid)) exitWith {
	hint "This house is for sale";
};


private["_player"];
_player = [_owner_uid] call A_player_fnc_lookup_uid;
if (undefined(_player)) exitWith {
	hint "The owner of this house is not connected.\nThe house will be available for sale in a few minutes";
};

hint format["This house belongs to %1-%2", _player, (name _player)];	
