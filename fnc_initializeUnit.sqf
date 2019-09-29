#include "\x\cba\addons\main\script_macros_common.hpp"
/*
    Author: Brandon (TCVM)
    Description:
        Initializes unit with markers and gear
        
    Arguments:
    1.  Unit which is being initialized <OBJECT>
    2.  Group ID of the unit <STRING>
    3.  Team colour of the unit <STRING>
    4.  Loadout class of the unit <STRING>
    5.  Type of marker that will be attached to this group (or person) <STRING>
    6.  Color of marker <STRING>
    7.  If you will attach it to the unit or the group <BOOL>
    8.  Size of marker <NUMBER>
    
    Notes:
    Possible marker colors:
        "Default"
        "ColorBlack"
        "ColorRed"
        "ColorRedAlpha"
        "ColorGreen"
        "ColorGreenAlpha"
        "ColorBlue"
        "ColorYellow"
        "ColorOrange"
        "ColorWhite"
        "ColorPink"
        "ColorBrown"
        "ColorKhaki"
        
    Possible marker types:
        "infantry"
        "motorized"
        "mechanized"
        "hq"
        "medic"
        "armor"
        "heli"
        "plane"
        "mortar"
        "arty"
    
*/

PARAMS_4(_obj,_groupID,_team,_class);
DEFAULT_PARAM(4,_markerType,"infantry");
DEFAULT_PARAM(5,_markerColor,"ColorBlack");
DEFAULT_PARAM(6,_size,1);
DEFAULT_PARAM(7,_attachToUnit,false);

["nos_createGroupMarkers", [_groupID, side _obj, _obj, _markerType, _markerColor, _size, _attachToUnit]] call CBA_fnc_globalEvent;

[_obj, _groupID, _team, _class] call gear_fnc_setLoadout;
