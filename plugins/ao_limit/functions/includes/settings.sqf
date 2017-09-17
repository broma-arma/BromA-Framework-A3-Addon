
// What will happen to players who leave the AO.
// "_pos" will refer to their position as they attempt to leave.
// "_targetObject" refers to their current unit/vehicle.

left_ao_do = { hintSilent "Please remain within the Area of Operations." };
//left_ao_do = { _targetObject setPos _pos };
//left_ao_do = { _targetObject setDamage 1 };