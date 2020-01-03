#include "script_main.hpp"
#define COMPILE_AND_CALL(var1,var2) EPREP(var1,var2); call EFUNC(var1, var2);
/*
 * Author: Brandon (TCVM)
 * Initialize NOS framework functions
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call compile preProcessFileLineNumbers "nos\nos_preInit.sqf"
 *
 * Public: No
 */
COMPILE_AND_CALL(ai,preInit);
COMPILE_AND_CALL(main,preInit);
COMPILE_AND_CALL(spectator,preInit);

