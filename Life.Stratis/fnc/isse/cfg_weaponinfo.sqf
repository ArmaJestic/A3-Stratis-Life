// A_isse_fnc_cfg_weaponinfo

#include "..\..\includes\macro.h"


    private["_cfg", "_name", "_DescShort", "_DescLong", "_Pic", "_Type"];
    _name = _this;
    _cfg = (configFile >> "CfgWeapons" >> _name);
    _DescShort = if (isText(_cfg >> "displayName")) then {
        getText(_cfg >> "displayName")
    }
    else {
        "/"
    };

    _DescLong  = if (isText(_cfg >> "Library" >> "libTextDesc")) then {
        getText(_cfg >> "Library" >> "libTextDesc")
    }
    else {
        "/"
    };

    _Pic = if (isText(_cfg >> "picture")) then {
        getText(_cfg >> "picture")
    }
    else {
        "/"
    };

    _Type = if (isText(_cfg >> "type")) then {
        parseNumber(getText(_cfg >> "type"))
    }
    else {
        getNumber(_cfg >> "type")
    };

    [_DescShort, _DescLong, _Type, _Pic]
