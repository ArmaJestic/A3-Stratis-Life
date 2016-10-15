#include "..\includes\constants.h"

class LBgFrame {
	type=0;
	idc=-1;
	style=64;
	colorBackground[]={0.4, 0.4, 0.4, 0.75};
	colorText[]={1, 1, 1, 1};
	font="PuristaMedium";
	SizeEX=0.025;
	text="";
};

class LBox {
	type = 5;
	style = 0;
	shadow = 0;
	colorSelect[] = {0, 0, 0, 1.0};
	colorText[] = {1, 1, 1, 1};
	colorBackground[] = {0.8, 0.8, 0.8, 0.3};
	colorSelectBackground[] = {0.7, 0.7, 0.7, 1};
	colorScrollbar[] = {Dlg_Color_White,1};
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	color[] = {1,1,1,1};
	colorActive[] = {1,0,0,1};
	colorDisabled[]	 = {1,0,0,0.3};
	font = "PuristaMedium";
	sizeEx = 0.031;
	rowHeight = 0.03;
	
	soundEnter[] = {"\A3\ui_f\data\sound\onover",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\new1",0.0,0};
	soundClick[] = {"\A3\ui_f\data\sound\onclick",0.07,1};
	soundEscape[] = {"\A3\ui_f\data\sound\onescape",0.09,1};
	soundSelect[] = {"\A3\ui_f\data\sound\new1",0.0,0};
	soundExpand[] = {"\A3\ui_f\data\sound\new1",0.0,0};
	soundCollapse[] = {"\A3\ui_f\data\sound\new1",0.0,0};
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	maxHistoryDelay = 1;
	
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
	class ListScrollBar
	{
		color[] = {1,1,1,1};
		autoScrollEnabled = 1;
	};
};

class ListMenu {
	idd = listMenu_idd;
	movingEnable = true;
	controlsBackground[] = {mainBackground, mainFrame};
	objects[] = { };
	controls[] = {
		 titleLabel, addToListButton, removeFromListButton, closeButton,
		 itemsList
	};

	name = "LIST_MENU";
	onUnload = "[] call A_interaction_fnc_weapon_modifications_menu_close;";
	onLoad="uiNamespace setVariable['LIST_MENU', _this select 0]";
	
	class mainFrame : LBgFrame {
		idc = listMenu_mainFrame_idc;
		x = 0.42; y = -0.13;
		w = 0.46; h = 0.90;
		text = "";
	};
	
	class titleLabel : RscText {
		idc = listMenu_titleLabel_idc;
		style = 2;
		x = 1.14; y = 0.60;
		w = 0.2105; h = 0.04;
		colorBackground[] = BOX_BACKGROUND;
		text = "";
	};
	
	class addToListButton : RscButton {
		idc = listMenu_addToListButton_idc;
		x = 0.6605; y = 0.70;
		w = 0.20; h = 0.04;
		text = "Add to list";
		action = "";
	};

	class removeFromListButton : RscButton {
		idc = listMenu_removeFromListButton_idc;
		x = 0.6605; y = 0.70;
		w = 0.20; h = 0.04;
		text = "Remove from list";
		action = "";
	};
	
	class closeButton : RscButton {
		idc = listMenu_closeButton_idc;
		x = 0.6605; y = 0.70;
		w = 0.20; h = 0.04;
		text = "Close";
		action = "";
	};
	
	class mainBackground: RscBackground {
		idc = listMenu_mainBackground_idc;
		moving = 1;
		x = 0.42; y = -0.13;
		w = 0.46; h = 0.90;
	};
	
	class itemsList : LBox {
		idc = listMenu_itemsList_idc;
		x = 0; y = 0;
		w = 0.12; h = 0.035;
	};
};
