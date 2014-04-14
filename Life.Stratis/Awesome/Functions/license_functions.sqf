#include "macro.h"

if (not(undefined(license_functions_defined))) exitWith {null};
#include "constants.h"
#include "macro.h"

license_id = 0;
license_vendors = 1;
license_name = 2;
license_price = 3;

INV_Licenses =
[
	["car",[university,university,university,pmclicenses],localize "STRS_license_car",5000],
	//["pick-up",[university,university,university,university],localize "STRS_licence_pick-up",25000],
	["boat",[university,university,university,university],localize "STRS_license_boat",15000],
	["truck",[university,university,pmclicenses,university],localize "STRS_license_truck",32500],
	["oil",[Oil_1,Oil_1,Oil_1,Oil_1],"Oil Processor's License",45000],
	["diamond",[Diamond_1,Diamond_1,Diamond_1,Diamond_1],"Diamond Processor's License",95000],
	//["Baker",[Bakery_1,Bakery_1,Bakery_1,Bakery_1],"Baker's license",1000],
	["glassblowing",[Glassblower,Glassblower,Glassblower,Glassblower],localize "STRS_license_glassblowerlicense",65000],
	["cocaine ga1",[gangarea1,gangarea1,gangarea1,gangarea1],"GA1 Cocaine Processing Training",30000],
	["lsd ga1",[gangarea1,gangarea1,gangarea1,gangarea1],"GA1 LSD Processing Training",15000],
	["heroin ga2",[gangarea2,gangarea2,gangarea2,gangarea2],"GA2 Heroin Processing Training",25000],
	["lsd ga2",[gangarea2,gangarea2,gangarea2,gangarea2],"GA2 LSD Processing Training",15000],
	["heroin ga3",[gangarea3,gangarea3,gangarea3,gangarea3],"GA3 Heroin Processing Training",25000],
	["marijuana ga3",[gangarea3,gangarea3,gangarea3,gangarea3],"GA3 Marijuana Processing Training",10000],
	["air",[university,university,university,pmclicenses],localize "STRS_license_air",1275000],
	["pistollicense",[pmclicenses,licenseflag2,licenseflag2,licenseflag2],"Pistol License",40000],
	//["gunprobationpistol",[],"Probation Pistol License",5000],
	["riflelicense",[pmclicenses,licenseflag2,licenseflag2,licenseflag2],"Rifle License",125000],
	//["automatic",[pmclicenses,licenseflag2,licenseflag2,licenseflag2],"Assault Weapon License",205000],
	["engineer",[pmclicenses,university],localize "STRS_license_engineer",65000],
	["bomb",[terrorshop],"Combat Training",3000000],
	["probator",[cp2atm,cp2atm,cp2atm,cp2atm],localize "STRS_license_probator",10000],
	["patrol",[cp2atm,cp2atm,cp2atm,cp2atm],localize "STRS_license_coppatrol",15000],
	["response",[cp2atm,cp2atm,cp2atm,cp2atm],localize "STRS_license_copresponse",350000],
	["sobr",[cp2atm,cp2atm,cp2atm,cp2atm],localize "STRS_license_copswat",3000000],
	["air_support_training",[cp2atm,cp2atm,cp2atm,cp2atm],localize "STRS_license_copairsupport",1250000],
	//["passport_civilian",[university,university,university,university],"Passport",85000],
	["pmc_license_journeyman",[pmclicenses,pmclicenses,pmclicenses,pmclicenses],"PMC Journeyman License",3000000],
	["pmc_defense",[pmclicenses,pmclicenses,pmclicenses,pmclicenses],"PMC Defense License",5000000],
	["pmc_license_air",[pmclicenses,pmclicenses,pmclicenses,pmclicenses],"PMC Pilot License",2500000]
	//["soviet_vehicles",[terrorshop],"Soviet Vehicle Training",5000000],
	//["soviet_air_veh",[terrorshop],"Soviet Aircraft Training",3000000],
	//["paramedic_license",[tdoc,tdoc,tdoc,tdoc],"Paramedic Training",750000]
	//["assassin",[agunshop,agunshop,objnull],"Assassin Training",30000]
];


license_player_near = {
	//player groupChat format["license_player_near %1", _this];
	ARGV(0,_player);
	ARGV(1,_distance);
	
	if (not([_player] call player_exists)) exitWith {null};
	if (undefined(_distance)) exitWith {null};
	if (typeName _distance != "SCALAR") exitWith {null};
	
	private["_min_distance", "_min_vendor"];
	_min_distance = _distance;
	_min_vendor = null;
	
	{
		private["_clicense", "_cvendors"];
		_clicense = _x;
		_cvendors = _clicense select license_vendors;
		{
			private["_cvendor", "_cdistance"];
			_cvendor = _x;
			_cdistance = _player distance _cvendor;
			if (_cdistance < _min_distance) then {
				_min_distance = _cdistance;
				_min_vendor = _cvendor;
			};
		} forEach _cvendors;
	} forEach INV_Licenses;
	
	if (undefined(_min_vendor)) exitWith {null};
	_min_vendor
};


license_actions = [];
license_remove_actions = {
	//player groupChat format["license_remove_actions %1", _this];
	if (count license_actions == 0) exitWith {null};
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {null};
	
	{
		private["_action_id"];
		_action_id = _x;
		_player removeAction _action_id;
	} forEach license_actions;
	license_actions = [];
};

license_add_actions = {
	//player groupChat format["license_add_actions %1", _this];
	if (count license_actions > 0) exitWith {null};
	ARGV(0,_player);
	ARGV(1,_vendor);

	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_vendor)) exitWith {null};
	if (typeName _vendor != "OBJECT") exitWith {null};
	
	{
		private["_clicense", "_clicense_id", "_clicense_name", "_clicense_price", "_clicense_vendors"];
		_clicense = _x;
		_clicense_id = _clicense select license_id;
		_clicense_name = _clicense select license_name;
		_clicense_price = _clicense select license_price;
		_clicense_vendors = _clicense select license_vendors;
		
		if (_vendor in _clicense_vendors) then {
			private["_action_id"];
			_action_id = player addAction [format["Buy %1 ($%2)", _clicense_name, strM(_clicense_price)], "noscript.sqf", 
											format['[%1, "%2"] call license_add;', _player, _clicense_id], 0, false, false, "",
											format['not([%1, "%2"] call player_has_license)', _player, _clicense_id]
											];
			license_actions = license_actions + [_action_id];
		};
	} forEach INV_Licenses;
};

license_pmc = {
	ARGV(0,_license_id);
	if (undefined(_license_id)) exitWith {false};
	if (typeName _license_id != "STRING") exitWith {false};

	(_license_id in ["pmc_license_journeyman", "pmc_defense", "pmc_license_air"])
};

license_add = {
	ARGV(0,_player);
	ARGV(1,_license_id);
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_license_id)) exitWith {null};
	if (typeName _license_id != "STRING") exitWith {null};
	if (_license_id == "") exitWith {null};
	
	private["_denied", "_denied_message"];
	_denied = false;
	_denied_message = "";
	if ([_license_id] call license_pmc) then {
		if (not([_player] call player_civilian)) then {
			_denied = true; 
			_denied_message = "You cannot access PMC Licenses, you are not a civilian";
		}
		else { if (not([player] call player_pmc))  then {
			_denied = false; 
			_denied_message = "You cannot access PMC Licenses, the police chief has not added you to the whitelist";
		};};
	};
	
	if (_denied) exitWith {
		player groupChat _denied_message;
	};
	
	[_player, [_license_id]] call player_add_licenses;
};

license_functions_defined = true;