#include "macro.h"

//stun_armor

_action = _this select 0;
_item   = _this select 1;
_amount = _this select 2;

switch _item do {
	case "stun_light": {
		[player, "stun_armor", "light", true] call object_setVariable;
		player groupchat "You put on light stun Armor";
		[player, _item, -1] call inventory_add_item;
		[player, "stun_light_on", 1] call inventory_add_item;
	};

	case "stun_light_ter": {
		[player, "stun_armor", "light", true] call object_setVariable;
		player groupchat "You put on light stun Armor";
		[player, _item, -1] call inventory_add_item;
		[player, "stun_light_on", 1] call inventory_add_item;
	};

	case "stun_light_ill": {
		[player, "stun_armor", "light", true] call object_setVariable;
		player groupchat "You put on light stun Armor";
		[player, _item, -1] call inventory_add_item;
		[player, "stun_light_on", 1] call inventory_add_item;
	};
	
	case "stun_full": {
		[player, "stun_armor", "full", true] call object_setVariable;
		player groupchat "You put on Full stun Armor";
		[player, _item, -1] call inventory_add_item;
		[player, "stun_full_on", 1] call inventory_add_item;
	};
	
	case "stun_light_on":{
		[player, "stun_armor", "", true] call object_setVariable;
		player groupchat "You took off your light stun Armor";
		[player, _item, -1] call inventory_add_item;
		[player, "stun_light", 1] call inventory_add_item;
	};
	case "stun_full_on": {
		[player, "stun_armor", "", true] call object_setVariable;
		player groupchat "You took off your Full stun Armor";
		[player, _item, -1] call inventory_add_item;
		[player, "stun_full", 1] call inventory_add_item;
	};
};