params ["_id","_array"];

private _element = (_array select {(_x select 0) == _id}) select 0;

_element
