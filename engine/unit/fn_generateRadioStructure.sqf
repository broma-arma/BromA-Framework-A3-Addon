#include "component.hpp"
/*
================================================================================

NAME:
    BRM_fnc_generateRadioStructure

AUTHOR(s):
    Nife

DESCRIPTION:
    Generates the radio structure for the side ORBAT. Mostly useful for Armastock.

PARAMETERS:
    0 - Side (SIDE)

USAGE:
    [west] call BRM_fnc_generateRadioStructure

RETURNS:
    The structured ORBAT with radio frequencies. (STRING)

================================================================================
*/

params ["_side"];

private _sideCallsigns = [_side, "callsigns"] call BRM_FMK_fnc_getSideInfo;

_sideCallsigns params [
"_z","_a", "_b", "_c", "_d",
"_r", "_s", "_w", "_sh", "_p", "_m",
"_l", "_t", "_h", "_pe"];

private _longRangeFrequenciesList = format["
(your channels and alt-channels have already been set up)<br/>
<br/>
<font color='#db0f0f'>Mission Command:</font color> CH 1<br/>
<br/>
1st Platoon <font color='#ffde0c'>--------------------------------------------</font color><br/>
<br/>
<font color='#db0f0f'>1st Platoon:</font color> CH 2<br/>
    <font color='#db0f0f'>Ground Assets:</font color>: CH 4<br/>
    <br/>
    <font color='#ffde0c'>%1 '1</font color>: 30<br/>
    <br/>
        <font color='#0f93db'>%2</font color>: 31<br/>
             <font color='#50ba0e'>%2 Actual</font color>: 31.9<br/>
                <font color='#50ba0e'>%2 '1</font color>: 31.1<br/>
                <font color='#50ba0e'>%2 '2</font color>: 31.2<br/>
        <font color='#0f93db'>%3</font color>: 32<br/>
            <font color='#50ba0e'>%3 Actual</font color>: 32.9<br/>
                <font color='#50ba0e'>%3 '1</font color>: 32.1<br/>
                <font color='#50ba0e'>%3 '2</font color>: 32.2<br/>
        <font color='#0f93db'>%4</font color>: 33<br/>
            <font color='#50ba0e'>%4 Actual</font color>: 33.9<br/>
                <font color='#50ba0e'>%4 '1</font color>: 33.1<br/>
                <font color='#50ba0e'>%4 '2</font color>: 33.2<br/>
        <font color='#0f93db'>%5</font color>: 34<br/>
            <font color='#50ba0e'>%5 Actual</font color>: 34.9<br/>
                <font color='#50ba0e'>%5 '1</font color>: 34.1<br/>
                <font color='#50ba0e'>%5 '2</font color>: 34.2<br/>
                <br/>
        <font color='#0f93db'>%12</font color>: 41<br/>
            <font color='#50ba0e'>%12 '1</font color>: 41.1<br/>
            <font color='#50ba0e'>%12 '2</font color>: 41.2<br/>
        <font color='#0f93db'>%13</font color>: 42<br/>
            <font color='#50ba0e'>%13 '1</font color>: 42.1<br/>
            <font color='#50ba0e'>%13 '2</font color>: 42.2<br/>
    <br/>
2nd Platoon <font color='#ffde0c'>--------------------------------------------</font color><br/>
<br/>
<font color='#db0f0f'>2nd Platoon</font color>: CH 3<br/>
    <font color='#db0f0f'>Supplies and Logistics</font color>: CH 5<br/>
    <font color='#db0f0f'>Air Support</font color>: CH 6<br/>
<br/>
    <font color='#ffde0c'>%1 '2</font color>: 30.9<br/>
        <br/>
        <font color='#0f93db'>%6</font color>: 35.9<br/>
        <font color='#0f93db'>%7</font color>: 36.9<br/>
        <font color='#0f93db'>%8</font color>: 37.9<br/>
        <font color='#0f93db'>%11</font color>: 40.9<br/>
        <br/>
        <font color='#0f93db'>%9</font color>: 38.9<br/>
        <font color='#0f93db'>%10</font color>: 39.9<br/>
        <font color='#0f93db'>%14 - Transport</font color>: 43<br/>
            <font color='#50ba0e'>%14 '1</font color>: 43.1<br/>
            <font color='#50ba0e'>%14 '2</font color>: 43.2<br/>
        <br/>
        <font color='#0f93db'>%14 - CAS</font color>: 43<br/>
            <font color='#50ba0e'>%14 '3</font color>: 43.3<br/>
            <font color='#50ba0e'>%14 '4</font color>: 43.4<br/>
        <font color='#0f93db'>%15</font color>: 44<br/>
            <font color='#50ba0e'>%15 '3</font color>: 44.1<br/>
            <font color='#50ba0e'>%15 '4</font color>: 44.1
", _z,_a,_b,_c,_d,_r,_s,_w,_sh,_p,_m,_l,_t,_h,_pe];
//      1  2  3  4  5  6  7  8  9 10 11 12 13  14 15

_longRangeFrequenciesList
