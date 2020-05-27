/// @description  Approach(start, end, shift);
/// @param	start
/// @param  end
/// @param  shift

// This function moves one value (argument1) towards another (argument2) by the shift (argument3) given

//		If the shift is greater than the actual difference, it will only shift as much as is necessary
// to reach the target value (argument2)

if (argument0 < argument1)
    return min(argument0 + argument2, argument1); 
else
    return max(argument0 - argument2, argument1);