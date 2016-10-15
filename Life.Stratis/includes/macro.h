#define QUOTE(X) #X

#define DOUBLES(X,Y) ##X##_##Y
#define TRIPLES(X,Y,Z) ##X##_##Y##_##Z

#define strM(x) ([x, ","] call A_misc_fnc_format_integer)
#define strN(x) ([x, ""] call A_misc_fnc_format_integer)

#define UNDEFINED(X) ((isNil #X) || {X isEqualTo null})
#define DEFINED(X) !UNDEFINED(X)

#define ARGVD(o,v,d) private[#v]; if (isNil "_this" || {(typeName _this != "ARRAY") || {(o >= (count _this)) || {v = _this select o; isNil #v}}}) then {v = d};
#define ARGV(o,v) ARGVD(o,v,null)

#define MASTER_ARRAY_ITEM_NAME(x) (((x call A_inventory_fnc_get_item_array) select 2) select 1)
#define MASTER_ARRAY_ITEM_TYPE(x) (((x call A_inventory_fnc_get_item_array) select 1) select 0)

#define drawicon3d_control (uiNamespace getVariable "drawIcon3d_hud")
#define drawicon3d_text_field (drawicon3d_control displayCtrl drawIcon3d_text_idc)
#define nearCursorTarget (if (isNil "A_nametags_var_cursortarget__") then {objNull} else {A_nametags_var_cursortarget__})

#define ITEM_DATA(key) (missionNamespace getVariable [format["A_MS_%1", key], []])
#define ITEM_DATA_KEY(data) (data select 0)
#define ITEM_DATA_TYPE(data) ((data select 1) select 0)
#define ITEM_DATA_KIND(data) ((data select 1) select 1)
#define ITEM_DATA_CLASS(data) ((data select 2) select 0)
#define ITEM_DATA_NAME(data) ((data select 2) select 1)
#define ITEM_DATA_ANIMAL(data) ((data select 5) select 4)
#define ITEM_DATA_ANIMAL_HABITAT(data) ((data select 5) select 7)
#define ITEM_DATA_ANIMAL_SEA(data) (ITEM_DATA_ANIMAL_HABITAT(data) == "sea")
#define ITEM_DATA_ANIMAL_LAND(data) (ITEM_DATA_ANIMAL_HABITAT(data) == "land")
#define ITEM_DATA_WEIGHT(data) ((data select 4) select 0)
#define ITEM_DATA_ICON(data) ((data select 5) select 6)
#define ITEM_DATA_ORE(data) (((data select 1) select 1) == "ore")
#define ITEM_DATA_ORE_TEXTURE(data) ((data select 5) select 7)
#define OBJECT_CHEMLIGHT(x) (configName(inheritsFrom(configFile >> "CfgMagazines" >> (typeOf x))) == "Chemlight_green")

#define NORMALIZE_ANGLE(a) ((360 + a % 360)) % 360

// to be removed
// For logging
// Always log
#define LOGE(F,S) format["%1: %2", QUOTE(F), S] call A_err_fnc_log;
#define LOGES(F) LOGE(F,"")
#define LOGE_EP(F) LOGE(F,"error, params")
// Log if logging enabled
#define LOGED(F,S) format["%1: %2", QUOTE(F), S] call A_err_fnc_logd;
#define LOGEDS(F) LOGED(F,"")
