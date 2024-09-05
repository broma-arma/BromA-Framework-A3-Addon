// =============================================================================
//
//   Here you can load or unload any extra content you want to be loaded in
//                              your mission.
//
// =============================================================================

#ifndef CONTENT_CARGO
#define CONTENT_CARGO(VAR,VALUE,COUNT) private _##VAR = VALUE
#endif
#ifndef CONTENT_CARGO_A
#define CONTENT_CARGO_A(NAME,VAR,COUNT)
#endif
#ifndef CONTENT_CARGO_N
#define CONTENT_CARGO_N(VAR,VALUE,NAME,COUNT) private _##VAR = VALUE
#endif

#include "vanilla-weapon-list.sqf"
#include "accessory-list.sqf"
#include "broma-weapon-list.sqf"
#include "broma-misc-list.sqf"
#include "broma-people-list.sqf"
