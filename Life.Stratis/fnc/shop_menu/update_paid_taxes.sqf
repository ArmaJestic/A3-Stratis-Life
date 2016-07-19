// A_shop_menu_fnc_update_paid_taxes

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_sales_tax);
if (undefined(_sales_tax)) exitWith {null};
if (typeName _sales_tax != "SCALAR") exitWith {null};

if (undefined(A_inventory_var_A_inventory_var_INV_TaxesPaid)) then { A_inventory_var_A_inventory_var_INV_TaxesPaid = 0; };
A_inventory_var_A_inventory_var_INV_TaxesPaid = A_inventory_var_A_inventory_var_INV_TaxesPaid + _sales_tax;
