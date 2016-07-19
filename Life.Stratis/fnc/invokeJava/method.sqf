// A_invokeJava_fnc_method

#include "../../includes/constants.h"
#include "../../includes/macro.h" 

diag_log format['A_invokeJava_fnc_method: %1', _this];

if (undefined(_this)) exitWith{diag_log format['A_invokeJava_fnc_method: exit1']; ""};
if (typeName _this != "ARRAY") exitWith {diag_log format['A_invokeJava_fnc_method: exit2']; ""};
if (count _this == 0) exitWith {diag_log format['A_invokeJava_fnc_method: exit3']; ""};
if (useDefaultSave) exitwith {_this call A_defaultSave_fnc_invoke};

private["_i", "_count", "_arguments", "_method"];
_method = _this select 0;
if (typeName _method != "STRING") exitWith {diag_log format['A_invokeJava_fnc_method: exit4']; null};

_count = count _this;
_arguments = [];

_i = 1;
while { _i < _count } do {
	private["_argument"];
	_argument = _this select _i;
	_argument = if (typeName _argument != "STRING") then { format["%1", _argument] } else {_argument};
	_arguments set [(_i - 1), _argument];
	_i = _i + 1;
};
	
private["_argument_str", "_method_str", "_invoke_str"];
_argument_str = "";

_i = 0;
_count = count _arguments;
while { _i < _count } do {
	_argument_str = _argument_str + "<A>" + (_arguments select _i)  + "</A>";
	_i = _i + 1;
};

_argument_str = "<AL>" + _argument_str + "</AL>";
_method_str = "<M>" + _method + "</M>";
_invoke_str = "<MI>" + _method_str + _argument_str + "</MI>";

//diag_log _invoke_str;
diag_log format['A_invokeJava_fnc_method: callExtension'];

private["_result"];
_result = "jni" callExtension _invoke_str;

diag_log format['A_invokeJava_fnc_method: complete, returning result'];
_result