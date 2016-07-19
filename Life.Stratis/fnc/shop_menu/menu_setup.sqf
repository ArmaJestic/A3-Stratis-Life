// A_shop_menu_fnc_menu_setup

#include "../../includes/constants.h"
#include "../../includes/macro.h"


disableSerialization;
//player groupChat format["A_shop_menu_fnc_menu_setup"];

private["_display"];
_display = uiNamespace getVariable "SHOPS_MENU";

_buy_background = _display displayCtrl buy_background_idc;
_sell_background = _display displayCtrl sell_background_idc;
_buy_frame = _display displayCtrl buy_frame_idc;
_sell_frame = _display displayCtrl sell_frame_idc;
_sell_show_all_items_label = _display displayCtrl sell_show_all_items_label_idc;
_sell_show_all_items_cbox = _display displayCtrl sell_show_all_items_cbox_idc;
_buy_put_gear_label = _display displayCtrl buy_put_gear_label_idc;
_buy_put_gear_cbox = _display displayCtrl buy_put_gear_cbox_idc;

_sell_items_list = _display displayCtrl sell_items_list_idc;
_sell_button = _display displayCtrl sell_button_idc;
_sell_button_cancel = _display displayCtrl sell_button_cancel_idc;
_sell_demand_label = _display displayCtrl sell_demand_label_idc;
_sell_demand_field = _display displayCtrl sell_demand_field_idc;
_sell_items_to_sell_label = _display displayCtrl sell_items_to_sell_label_idc;
_sell_items_to_sell_field = _display displayCtrl sell_items_to_sell_field_idc;
_sell_items_to_sell_background = _display displayCtrl sell_items_to_sell_background_idc;
_sell_market_adjust_label = _display displayCtrl sell_market_adjust_label_idc;
_sell_market_adjust_field = _display displayCtrl sell_market_ajust_field_idc;
_sell_sales_tax_label = _display displayCtrl sell_sales_tax_label_idc;
_sell_sales_tax_field = _display displayCtrl sell_sales_tax_field_idc;
_sell_total_return_label = _display displayCtrl sell_total_return_label_idc;
_sell_total_return_field = _display displayCtrl sell_total_return_field_idc;
					
_buy_items_list = _display displayCtrl buy_items_list_idc;
_buy_button = _display displayCtrl buy_button_idc;
_buy_button_cancel = _display displayCtrl buy_button_cancel_idc;
_buy_supply_label = _display displayCtrl buy_supply_label_idc;
_buy_supply_field = _display displayCtrl buy_supply_field_idc;
_buy_items_to_buy_label = _display displayCtrl buy_items_to_buy_label_idc;
_buy_items_to_buy_field = _display displayCtrl buy_items_to_buy_field_idc;
_buy_tiems_to_buy_field_background = _display displayCtrl buy_tiems_to_buy_field_background_idc;
_buy_market_adjust_label = _display displayCtrl buy_market_adjust_label_idc;
_buy_market_adjust_field = _display displayCtrl buy_marked_adjust_field_idc;
_buy_sales_tax_label = _display displayCtrl buy_sales_tax_label_idc;
_buy_sales_tax_field = _display displayCtrl buy_salex_tax_field_idc;
_buy_total_due_label = _display displayCtrl buy_total_due_label_idc;
_buy_total_due_field = _display displayCtrl buy_total_due_field_idc;
	
_buy_sell_status_background = _display displayCtrl buy_sell_status_background_idc;
_buy_sell_status_frame = _display displayCtrl buy_sell_status_frame_idc;
_buy_sell_status_label = _display displayCtrl buy_sell_status_label_idc;

_shop_vehicle_list = _display displayCtrl shop_vehicle_list_idc;
_shop_vehicle_header = _display displayCtrl shop_vehicle_header_idc;
_shop_vehicle_background = _display displayCtrl shop_vehicle_background_idc;
_shop_vehicle_select_button = _display displayCtrl shop_vehicle_select_button_idc;
_shop_vehicle_cancel_button = _display displayCtrl shop_vehicle_cancel_button_idc;

private["_x", "_y", "_ysep", "_sep", "_buy_title", "_title_sell", "_w", "_h"];
_x = 0.14;
_y = 0.14;
_w = 0.45;
_h = 0.83;
_ysep = 0.003;
_sep = 0.01;
_buy_title = "BUY ITEMS";
_sell_title = "SELL ITEMS";

private["_button_font_height", "_font_family"];
_button_font_height = MENU_TITLE_FONT_HEIGHT;
_font_family = "PuristaMedium";

//buy header
private["_bhx", "_bhy", "_bhw", "_bhh"];
_bhx = _x;
_bhy = _y;
_bhw = _w;
_bhh = 0.045;

_buy_frame ctrlSetPosition [_bhx, _bhy, _bhw, _bhh];
_buy_frame ctrlSetFontHeight _button_font_height;
_buy_frame ctrlSetText _buy_title;
_buy_frame ctrlSetFont _font_family;
_buy_frame ctrlCommit 0;

//buy close button
private["_bcx", "_bcy", "_bcw", "_bch"];
_bcw = 0.14;
_bch = _bhh;
_bcx = _bhx + _bhw - _bcw;
_bcy = _bhy + _h - _bch;

_buy_button_cancel ctrlSetText "Cancel";
_buy_button_cancel ctrlSetPosition [_bcx, _bcy, _bcw, _bch];
buttonSetAction [(ctrlIDC _buy_button_cancel), "closeDialog 0"];
_buy_button_cancel ctrlCommit 0;

//buy background
private["_bbx", "_bby", "_bbw", "_bbh"];
_bbx = _bhx;
_bby = _bhy + _bhh + _ysep;
_bbw = _w;
_bbh = (_bcy ) - (_bhy ) - _bch - _ysep - _ysep;

_buy_background ctrlSetPosition [_bbx, _bby, _bbw, _bbh];
_buy_background ctrlSetBackgroundColor [0,0,0,0.65];
_buy_background ctrlCommit 0;

//buy button
private["_btx", "_bty" ,"_btw", "_bth"];
_btx = _bhx;
_bty = _bby + _bbh + _ysep;
_btw = _bcw * 1.2;
_bth = _bch;

_buy_button ctrlSetText "Buy";
_buy_button ctrlSetPosition [_btx, _bty, _btw, _bth];
_buy_button ctrlCommit 0;

//buy list
private["_blx", "_bly", "_blw", "_blh"];
_blx = _bbx + _sep;
_bly = _bby + _sep;
_blw = _bbw - _sep * 2;
_blh = _bbh * 0.55;

//player groupChat format["_blh = %1", _blh];

_buy_items_list ctrlSetPosition [_blx, _bly, _blw, _blh];
_buy_items_list ctrlSetFontHeight _button_font_height * 0.9;
_buy_items_list ctrlCommit 0;

//items to buy label
private["_bilx", "_bily", "_bilw", "_bilh"];
_bilx = _blx; 
_bily = _bly + _blh + _sep * 2;
_bilw = _blw / 2  - _sep;
_bilh = 0.04;


_buy_items_to_buy_label ctrlSetText "Items to buy:";
_buy_items_to_buy_label ctrlSetPosition [_bilx, _bily, _bilw, _bilh];
_buy_items_to_buy_label ctrlSetFontHeight _button_font_height - 0.003;
_buy_items_to_buy_label ctrlCommit 0;

//items to buy field
private["_bifx", "_bify", "_bifw", "_bifh"];
_bifx = _bilx + _bilw + _sep ;
_bify = _bily;
_bifw = _bilw;
_bifh = _bilh;

_buy_items_to_buy_field ctrlSetFontHeight _button_font_height - 0.003;;
_buy_items_to_buy_field ctrlSetFont _font_family;
_buy_items_to_buy_field ctrlSetPosition [_bifx, _bify, _bifw, _bifh];
_buy_items_to_buy_field ctrlSetBackgroundColor [1,1,1,0.08];
_buy_items_to_buy_field ctrlCommit 0;


//buy supply label
private["_bslx", "_bsly", "_bslw", "_bslh"];
_bslx = _bilx; 
_bsly = _bily + _bilh + _ysep * 2;
_bslw = _bilw;
_bslh = _bilh;

_buy_supply_label ctrlSetText "Supply:";
_buy_supply_label ctrlSetPosition [_bslx, _bsly, _bslw, _bslh];
_buy_supply_label ctrlSetFontHeight _button_font_height - 0.003;
_buy_supply_label ctrlCommit 0;


//buy supply field
private["_bsfx", "_bsfy", "_bsfw", "_bsfh"];
_bsfx = _bslx + _bslw + _sep ;
_bsfy = _bsly;
_bsfw = _bslw;
_bsfh = _bslh;

_buy_supply_field ctrlSetFontHeight _button_font_height - 0.003;;
_buy_supply_field ctrlSetFont _font_family;
_buy_supply_field ctrlSetPosition [_bsfx, _bsfy, _bsfw, _bsfh];
_buy_supply_field ctrlSetBackgroundColor [1,1,1,0.08];
_buy_supply_field ctrlCommit 0;



//buy market adjustment label
private["_bmlx", "_bmly", "_bmlw", "_bmlh"];
_bmlx = _bslx; 
_bmly = _bsly + _bslh + _ysep * 2;
_bmlw = _bslw;
_bmlh = _bslh;

_buy_market_adjust_label ctrlSetText "Market adjustment:";
_buy_market_adjust_label ctrlSetPosition [_bmlx, _bmly, _bmlw, _bmlh];
_buy_market_adjust_label ctrlSetFontHeight _button_font_height - 0.003;
_buy_market_adjust_label ctrlCommit 0;


//buy market adjustment field
private["_bmfx", "_bmfy", "_bmfw", "_bmfh"];
_bmfx = _bmlx + _bmlw + _sep ;
_bmfy = _bmly;
_bmfw = _bslw;
_bmfh = _bslh;

_buy_market_adjust_field ctrlSetFontHeight _button_font_height - 0.003;;
_buy_market_adjust_field ctrlSetFont _font_family;
_buy_market_adjust_field ctrlSetPosition [_bmfx, _bmfy, _bmfw, _bmfh];
_buy_market_adjust_field ctrlSetBackgroundColor [1,1,1,0.08];
_buy_market_adjust_field ctrlCommit 0;



//buy sales tax label
private["_btlx", "_btly", "_btlw", "_btlh"];
_btlx = _bmlx; 
_btly = _bmly + _bmlh + _ysep * 2;
_btlw = _bmlw;
_btlh = _bmlh;

_buy_sales_tax_label ctrlSetText "Sales tax:";
_buy_sales_tax_label ctrlSetPosition [_btlx, _btly, _btlw, _btlh];
_buy_sales_tax_label ctrlSetFontHeight _button_font_height - 0.003;
_buy_sales_tax_label ctrlCommit 0;


//buy sales tax field
private["_btfx", "_btfy", "_btfw", "_btfh"];
_btfx = _btlx + _btlw + _sep ;
_btfy = _btly;
_btfw = _bmlw;
_btfh = _bmlh;

_buy_sales_tax_field ctrlSetFontHeight _button_font_height - 0.003;;
_buy_sales_tax_field ctrlSetFont _font_family;
_buy_sales_tax_field ctrlSetPosition [_btfx, _btfy, _btfw, _btfh];
_buy_sales_tax_field ctrlSetBackgroundColor [1,1,1,0.08];
_buy_sales_tax_field ctrlCommit 0;

//buy total due label
private["_bulx", "_buly", "_bulw", "_bulh"];
_bulx = _btlx; 
_buly = _btly + _btlh + _ysep * 2;
_bulw = _btlw;
_bulh = _btlh;

_buy_total_due_label ctrlSetText "Total due:";
_buy_total_due_label ctrlSetPosition [_bulx, _buly, _bulw, _bulh];
_buy_total_due_label ctrlSetFontHeight _button_font_height - 0.003;
_buy_total_due_label ctrlCommit 0;


//buy total due field
private["_bufx", "_bufy", "_bufw", "_bufh"];
_bufx = _bulx + _bulw + _sep ;
_bufy = _buly;
_bufw = _btlw;
_bufh = _btlh;

_buy_total_due_field ctrlSetFontHeight _button_font_height - 0.003;;
_buy_total_due_field ctrlSetFont _font_family;
_buy_total_due_field ctrlSetPosition [_bufx, _bufy, _bufw, _bufh];
//_buy_total_due_field ctrlSetBackgroundColor [1,1,1,0.08];
_buy_total_due_field ctrlCommit 0;


//buy check box
private["_bxlx", "_bxly", "_bxlw", "_bxlh"];
_bxlx = _bulx;
_bxly = _buly + _bulh + _ysep * 2;
_bxlw = _bulw * 2 + _sep;
_bxlh = _bulh;

_buy_put_gear_cbox ctrlSetPosition [_bxlx, _bxly, _bxlw, _bxlh];
_buy_put_gear_cbox ctrlSetBackgroundColor [1,0,0,1];
_buy_put_gear_cbox ctrlCommit 0;

_buy_put_gear_label ctrlSetText "[ ] - Put weapon in hands";
_buy_put_gear_label ctrlSetPosition [_bxlx, _bxly, _bxlw, _bxlh];
_buy_put_gear_label ctrlSetFontHeight _button_font_height - 0.003;
//_buy_put_gear_label ctrlSetbackgroundColor [1,0,0,1];
_buy_put_gear_label ctrlCommit 0;



//sell header
private["_bhx", "_bhy", "_bhw", "_bhh"];
_shx = _bhx + _bhw + _sep * 4;
_shy = _bhy;
_shw = _w;
_shh = _bhh;

_sell_frame ctrlSetPosition [_shx, _shy, _shw, _shh];
_sell_frame ctrlSetFontHeight _button_font_height;
_sell_frame ctrlSetText _sell_title;
_sell_frame ctrlSetFont _font_family;
_sell_frame ctrlCommit 0;

//sell close button
private["_scx", "_scy", "_scw", "_sch"];
_scw = 0.14;
_sch = _shh;
_scx = _shx + _shw - _scw;
_scy = _shy + _h - _sch;

_sell_button_cancel ctrlSetText "Cancel";
_sell_button_cancel ctrlSetPosition [_scx, _scy, _scw, _sch];
buttonSetAction [(ctrlIDC _sell_button_cancel), "closeDialog 0"];
_sell_button_cancel ctrlCommit 0;

//sell background
private["_sbx", "_sby", "_sbw", "_sbh"];
_sbx = _shx;
_sby = _shy + _shh + _ysep;
_sbw = _w;
_sbh = (_scy ) - (_shy ) - _sch - _ysep - _ysep;

_sell_background ctrlSetPosition [_sbx, _sby, _sbw, _sbh];
_sell_background ctrlSetBackgroundColor [0,0,0,0.65];
_sell_background ctrlCommit 0;

//sell button
private["_stx", "_sty" ,"_stw", "_sth"];
_stx = _shx;
_sty = _sby + _sbh + _ysep;
_stw = _scw * 1.2;
_sth = _sch;

_sell_button ctrlSetText "Sell";
_sell_button ctrlSetPosition [_stx, _sty, _stw, _sth];
_sell_button ctrlCommit 0;

//sell list
private["_slx", "_sly", "_slw", "_slh"];
_slx = _sbx + _sep;
_sly = _sby + _sep;
_slw = _sbw - _sep * 2;
_slh = _sbh * 0.55;

_sell_items_list ctrlSetPosition [_slx, _sly, _slw, _slh];
_sell_items_list ctrlSetFontHeight _button_font_height * 0.9;
_sell_items_list ctrlCommit 0;

//items to sell label
private["_silx", "_sily", "_silw", "_silh"];
_silx = _slx; 
_sily = _sly + _blh + _sep * 2;
_silw = _slw / 2  - _sep;
_silh = 0.04;

_sell_items_to_sell_label ctrlSetText "Items to sell:";
_sell_items_to_sell_label ctrlSetPosition [_silx, _sily, _silw, _silh];
_sell_items_to_sell_label ctrlSetFontHeight _button_font_height - 0.003;
_sell_items_to_sell_label ctrlCommit 0;

//items to sell field
private["_sifx", "_sify", "_sifw", "_sifh"];
_sifx = _silx + _silw + _sep ;
_sify = _sily;
_sifw = _silw;
_sifh = _silh;

_sell_items_to_sell_field ctrlSetFontHeight _button_font_height - 0.003;;
_sell_items_to_sell_field ctrlSetFont _font_family;
_sell_items_to_sell_field ctrlSetPosition [_sifx, _sify, _sifw, _sifh];
_sell_items_to_sell_field ctrlSetBackgroundColor [1,1,1,0.08];
_sell_items_to_sell_field ctrlCommit 0;

//sell demand label
private["_sdlx", "_sdly", "_sdlw", "_sdlh"];
_sdlx = _silx; 
_sdly = _sily + _bilh + _ysep * 2;
_sdlw = _silw;
_sdlh = _silh;

_sell_demand_label ctrlSetText "Demand:";
_sell_demand_label ctrlSetPosition [_sdlx, _sdly, _sdlw, _sdlh];
_sell_demand_label ctrlSetFontHeight _button_font_height - 0.003;
_sell_demand_label ctrlCommit 0;

//sell demand field
private["_sdfx", "_sdfy", "_sdfw", "_sdfh"];
_sdfx = _sdlx + _sdlw + _sep ;
_sdfy = _sdly;
_sdfw = _sdlw;
_sdfh = _sdlh;

_sell_demand_field ctrlSetFontHeight _button_font_height - 0.003;;
_sell_demand_field ctrlSetFont _font_family;
_sell_demand_field ctrlSetPosition [_sdfx, _sdfy, _sdfw, _sdfh];
_sell_demand_field ctrlSetBackgroundColor [1,1,1,0.08];
_sell_demand_field ctrlCommit 0;

//sell marked adjustment label
private["_smlx", "_smly", "_smlw", "_smlh"];
_smlx = _sdlx; 
_smly = _sdly + _sdlh + _ysep * 2;
_smlw = _sdlw;
_smlh = _sdlh;

_sell_market_adjust_label ctrlSetText "Market adjustment:";
_sell_market_adjust_label ctrlSetPosition [_smlx, _smly, _smlw, _smlh];
_sell_market_adjust_label ctrlSetFontHeight _button_font_height - 0.003;
_sell_market_adjust_label ctrlCommit 0;

//sell market adjustment field
private["_smfx", "_smfy", "_smfw", "_smfh"];
_smfx = _smlx + _smlw + _sep ;
_smfy = _smly;
_smfw = _sdlw;
_smfh = _sdlh;

_sell_market_adjust_field ctrlSetFontHeight _button_font_height - 0.003;;
_sell_market_adjust_field ctrlSetFont _font_family;
_sell_market_adjust_field ctrlSetPosition [_smfx, _smfy, _smfw, _smfh];
_sell_market_adjust_field ctrlSetBackgroundColor [1,1,1,0.08];
_sell_market_adjust_field ctrlCommit 0;



//sell sales tax label
private["_stlx", "_stly", "_stlw", "_stlh"];
_stlx = _smlx; 
_stly = _smly + _smlh + _ysep * 2;
_stlw = _smlw;
_stlh = _smlh;

_sell_sales_tax_label ctrlSetText "Sales tax:";
_sell_sales_tax_label ctrlSetPosition [_stlx, _stly, _stlw, _stlh];
_sell_sales_tax_label ctrlSetFontHeight _button_font_height - 0.003;
_sell_sales_tax_label ctrlCommit 0;


//sell sales tax field
private["_btfx", "_btfy", "_btfw", "_btfh"];
_stfx = _stlx + _stlw + _sep ;
_stfy = _stly;
_stfw = _smlw;
_stfh = _smlh;

_sell_sales_tax_field ctrlSetFontHeight _button_font_height - 0.003;;
_sell_sales_tax_field ctrlSetFont _font_family;
_sell_sales_tax_field ctrlSetPosition [_stfx, _stfy, _stfw, _stfh];
_sell_sales_tax_field ctrlSetBackgroundColor [1,1,1,0.08];
_sell_sales_tax_field ctrlCommit 0;


//sell total return label
private["_srlx", "_srly", "_srlw", "_srlh"];
_srlx = _stlx; 
_srly = _stly + _stlh + _ysep * 2;
_srlw = _stlw;
_srlh = _stlh;

_sell_total_return_label ctrlSetText "Total return:";
_sell_total_return_label ctrlSetPosition [_srlx, _srly, _srlw, _srlh];
_sell_total_return_label ctrlSetFontHeight _button_font_height - 0.003;
_sell_total_return_label ctrlCommit 0;


//sell total return field
private["_srfx", "_srfy", "_srfw", "_srfh"];
_srfx = _srlx + _srlw + _sep ;
_srfy = _srly;
_srfw = _stlw;
_srfh = _stlh;

_sell_total_return_field ctrlSetFontHeight _button_font_height - 0.003;;
_sell_total_return_field ctrlSetFont _font_family;
_sell_total_return_field ctrlSetPosition [_srfx, _srfy, _srfw, _srfh];
_sell_total_return_field ctrlSetBackgroundColor [1,1,1,0.08];
_sell_total_return_field ctrlCommit 0;

//sell check box
private["_sxlx", "_sxly", "_sxlw", "_sxlh"];
_sxlx = _srlx;
_sxly = _srly + _srlh + _ysep * 2;
_sxlw = _srlw * 2 + _sep;
_sxlh = _srlh;

_sell_show_all_items_cbox ctrlSetPosition [_sxlx, _sxly, _sxlw, _sxlh];
_sell_show_all_items_cbox ctrlSetBackgroundColor [1,0,0,1];
_sell_show_all_items_cbox ctrlCommit 0;

_sell_show_all_items_label ctrlSetText "[x] - Hide unsellable items";
_sell_show_all_items_label ctrlSetPosition [_sxlx, _sxly, _sxlw, _sxlh];
_sell_show_all_items_label ctrlSetFontHeight _button_font_height - 0.003;
//_sell_show_all_items_label ctrlSetbackgroundColor [1,0,0,1];
_sell_show_all_items_label ctrlCommit 0;

//error label
private["_ex", "_ey", "_ew", "_eh"];
_ex = _btx; 
_ey = _bty + _bth + _sep * 2;
_ew = (_shx + _shw) - (_bhx);
_eh = _bth;

_buy_sell_status_label ctrlSetText "Status field";
_buy_sell_status_label ctrlSetPosition [_ex, _ey - 0.003, _ew, _eh];
_buy_sell_status_label ctrlSetFontHeight _button_font_height - 0.003;
_buy_sell_status_label ctrlSetBackgroundColor [0,0,0,0];
_buy_sell_status_label ctrlCommit 0;

_buy_sell_status_frame ctrlSetPosition [_ex, _ey, _ew, _eh];
_buy_sell_status_frame ctrlCommit 0;

_buy_sell_status_background ctrlSetPosition [_ex, _ey, _ew, _eh];
_buy_sell_status_background ctrlSetBackgroundColor [0,0,0,0.65];
_buy_sell_status_background ctrlCommit 0;
