#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Starts spectator for the local client. Only called by events
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call nos_spectator_fnc_startSpectatorLocal
 *
 * Public: No
 */

[player] join grpNull;
player allowDamage false;
[QEGVAR(main,hideObject), [player, false]] call CBA_fnc_globalEvent;
[true] call acre_api_fnc_setSpectator;
[player, _this select 1] call ace_fnc_startSpectator;
ace_sys_spectator_playable_only = false;
ace_sys_spectator_can_exit_spectator = false;
ace_sys_spectator_no_butterfly_mode = true;