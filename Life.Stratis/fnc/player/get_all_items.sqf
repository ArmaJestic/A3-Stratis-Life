// A_player_fnc_get_all_items

#include "header.h"


//player groupChat format["A_player_fnc_get_all_items %1", _this];
ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {[]};

private["_uniformItems", "_vestItems", "_pWItems", "_sWItems", "_hgWItems", "_backPackItems", "_allItems"];
_uniformItems = uniformItems _player;
_vestItems = vestItems _player;
_pWItems = primaryWeaponItems _player;
_sWItems = secondaryWeaponItems _player;
_hgWItems = handgunItems _player;
_backPackItems = backpackItems _player;
_assignedItems = assignedItems _player;

private["_others"];
_others = [];
_others = _others + [([_player] call A_player_fnc_backpack)];
_others = _others + [([_player] call A_player_fnc_uniform)];
_others = _others + [([_player] call A_player_fnc_vest)];

_allItems = _uniformItems + _vestItems + _pWItems + _sWItems + _hgWItems + _backPackItems + _assignedItems + _others;
_allItems = _allItems - [""];
//player groupChat format["_allItems = %1", _allItems];
([(_allItems)] call A_misc_fnc_toLowerArray)
