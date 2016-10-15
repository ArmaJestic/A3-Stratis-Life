// A_settings_fnc_settings

#include "..\..\includes\macro.h"


_art = _this select 0;
_zusatzString = "";
if ((count _this)>1) then {_zusatzString = _this select 1;};

// Settings
if (_art == "Einstellungen") then {
	if (!(createDialog "MainMenu")) exitWith {hint "Dialog Error!";};
};

// Graphic Settings
if (_art == "GrafikEinstellungen") then {
	// calls "A_settings_fnc_settings.sqf"
	// then "settings_graphic.sqf"
	["closedialog 0; [""Einstellungen""] call A_settings_fnc_settings;"] spawn A_settings_fnc_graphic;
};

// Text Settings
if (_art == "TextEinstellungen") then {
	if (_zusatzString == "oeffnen") then {
		if (!(createDialog "SettingsDialog")) exitWith {hint "Dialog Error!";};
			
		for [{_i=1}, {_i <= 4}, {_i=_i+1}] do {
			call compile format["ctrlSetText[%1, RadioTextMsg_%1];", _i];
			call compile format["_index = lbAdd [1%1, 'Global'];lbSetData [1%1, _index, 'global'];if(RadioTextArt_%1 == 'global')then{lbSetCurSel [1%1, 0]};", _i];
			call compile format["_index = lbAdd [1%1, 'Side'  ];lbSetData [1%1, _index, 'side'  ];if(RadioTextArt_%1 == 'side'  )then{lbSetCurSel [1%1, 1]};", _i];
			call compile format["_index = lbAdd [1%1, 'Direct'];lbSetData [1%1, _index, 'direct'];if(RadioTextArt_%1 == 'direct')then{lbSetCurSel [1%1, 2]};", _i];
		};
	};
		
	if ( (_zusatzString == "speichern") and (ctrlVisible 1034) ) then {
		for [{_i=1}, {_i <= 4}, {_i=_i+1}] do {
			call compile format["RadioTextMsg_%1 = (ctrlText %1);", _i];
			call compile format["RadioTextArt_%1 = lbText[1%1, (lbCurSel 1%1)];", _i];
		};
		player groupChat "Saved!";
	};		
};

if (_art == "Tutorial") then {
	if (!(createDialog "TutorialDialog")) exitWith {hint "Dialog Error!";};
	ctrlSetText[1, localize "STRS_mainmenu_MissionTutorial"];
};

if (_art == "FAQ") then {
	if (!(createDialog "FAQDialog")) exitWith {hint "Dialog Error!";};
	ctrlSetText[1, localize "STRS_mainmenu_FAQ"];
};

if (_art == "About") then {
	if (!(createDialog "AboutDialog")) exitWith {hint "Dialog Error!";};
	ctrlSetText[1, localize "STRS_mainmenu_AboutThisMission"];
};

/*
if (_art == "ItemList") then {
	_handler = ["closedialog 0; [""Einstellungen""] call A_settings_fnc_settings;", "Back"] spawn A_dlg_fnc_itemlistdialog;
	waitUntil {scriptDone _handler};
};
*/
