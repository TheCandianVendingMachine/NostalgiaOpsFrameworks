#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Initialize NOS spectator functions and values
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call compile preProcessFileLineNumbers "nos_preInit.sqf"
 *
 * Public: No
 */
PREP(startSpectatorLocal);
PREP(stopSpectatorLocal);
PREP(unitKilledEvent);
PREP(disableAcreSpectatorLocal);

[QGVAR(startSpectatorLocal), FUNC(startSpectatorLocal)] call CBA_fnc_addLocalEventHandler;
[QGVAR(stopSpectatorLocal), FUNC(stopSpectatorLocal)] call CBA_fnc_addLocalEventHandler;
[QGVAR(stopAcreSpectatorLocal), FUNC(disableAcreSpectatorLocal)] call CBA_fnc_addLocalEventHandler;

FUNC(startSpectator) = {
    PARAMS_1(_unit);
    [QGVAR(startSpectatorLocal), [_unit]] call CBA_fnc_whereLocalEvent;
};

FUNC(stopSpectator) = {
    PARAMS_1(_unit);
    [QGVAR(stopSpectatorLocal), [_unit]] call CBA_fnc_whereLocalEvent;
};

FUNC(stopAcreSpectator) = {
    PARAMS_1(_unit);
    [QGVAR(stopAcreSpectatorLocal), [_unit]] call CBA_fnc_whereLocalEvent;
};

