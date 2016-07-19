#define QUOTE(X) #X
#define FNC_CFG_ENTRY(X) class X {file = QUOTE(X.sqf); ext = QUOTE(.sqf)};
