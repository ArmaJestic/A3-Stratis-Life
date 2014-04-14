#include "constants.h"

class WBgFrame {
	type=0;
	idc=-1;
	style=64;
	colorBackground[]={0.4, 0.4, 0.4, 0.75};
	colorText[]={1, 1, 1, 1};
	font="PuristaMedium";
	SizeEX=0.025;
	text="";
};

class WPicture {
	type = 0;
	idc =  -1;
	style = 48;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = "PuristaMedium";
	SizeEX=0.025;
	text = "";
};



class WCheckBox {
	idc = -1;
	type = 7;
	style = 2;
	
	colorText[] = {1, 1, 1, 1};
	color[] = {0, 1, 0, 1};
	colorTextSelect[] = {0, 0.8, 0, 1};
	colorSelectedBg[] = {1, 1, 1, 0};
	colorSelect[] = {0, 0, 0, 1};
	colorTextDisable[] = {0.4, 0.4, 0.4, 1};
	colorDisable[] = {0.4, 0.4, 0.4, 1};
	font = "PuristaMedium";
	SizeEX=0.025;
	rows = 1;
	columns = 1;
	strings[] = {""};
};

class WeaponModifications {
	idd = weaponModifications_idd;
	movingEnable = true;
	controlsBackground[] = {mainBackground, mainFrame};
	objects[] = { };
	controls[] = {
		weaponPicture,
		muzzleCombo, topRailCombo, sideRailCombo 
	};

	name = "WEAPON_MODS";
	onUnload = "[] call interact_weapon_modifications_menu_close;";
	onLoad="uiNamespace setVariable ['WEAPON_MODS', _this select 0]";

	class mainFrame : WBgFrame {
		idc = weaponModifications_mainFrame_idc;
		x = 0.42; y = -0.13;
		w = 0.46; h = 0.90;
		text = "Weapon Modifications";
	};
	
	class weaponPicture : WPicture {
		idc = weaponModifications_weaponPicture_idc;
		x = 0.42; y = -0.13;
		w = 0.46; h = 0.90;
	};

	class mainBackground: RscBackground {
		idc = weaponModifications_mainBackground_idc;
		moving = 1;
		x = 0.42; y = -0.13;
		w = 0.46; h = 0.90;
	};
	
	class muzzleCombo : RscCombo {
		idc = weaponModifications_muzzleCombo_idc;
		x = 0; y = 0;
		w = 0.12; h = 0.035;
	};
	
	class topRailCombo : RscCombo {
		idc = weaponModifications_topRailCombo_idc;
		x = 0; y = 0;
		w = 0.12; h = 0.035;
	};
	
	class sideRailCombo : RscCombo {
		idc = weaponModifications_sideRailCombo_idc;
		x = 0; y = 0;
		w = 0.12; h = 0.035;
	};
	
	class weaponModfications_control_idc : RscDummy {
		idc = weaponModifictions_control_idc;
	};
};