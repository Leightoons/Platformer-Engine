/// @desc ApplyHoriz()

// Apply Horizontal Movements and Collisions


//Convert hSpeed to usable integer
	#region //Expand for explanation
	//	Objects cannot move LESS than one pixel, since x and y positions are integers,
	//so we store the leftover fraction after the decimal point and add it back to the
	//total each step/frame before removing the new fractional remainder.
	
	//	This way, we can simulate speeds in between integers.
	//For example, if our hSpeed is 4.5, the 0.5 will be removed and stored and the player will
	//move 4 pixels that step.
	//	On the NEXT step, the 0.5 will be added back into hSpeed,
	//giving us a total of 5. Since there is nothing left over, the next step will be rounded down
	//to 4 again, but the remainder will be stored again and this cycle will continue.
	
	//	This cycle of switching between moving 4 and 5 pixels each step gives the illusion
	//that the player is moving 4.5 pixels per second.
	#endregion
	
hSpeed		+=	hSpeedFloat;					//add stored fraction
hSpeedFloat =	frac(hSpeed)					//store new leftover fraction
hSpeed		-=	hSpeedFloat;					//remove fraction, leaving integer

for (i = 0; i < abs(hSpeed); i++)				//MOVEMENT/COLLISION CHECK LOOP
													//	This loop moves the player one pixel at a time, then checks for a collision,
													//and if nothing is in the way, it continues to loop until it has reached it's movement speed
													//	It also checks for slopes and adjusts the player's position according to the steepness
{
	_skip = false;								//Reset _skip at start of each loop
													//_skip is used to skip horizontal increment when moving up a slope (to simulate slowing down)


#region //MOVING UP SLOPE//
	for( j=1; j <= 2; j++ )						//value here defines how steep a slope can be climbed
	 {
		 if (place_meeting(x + sign(hSpeed), y, parSolid) && !place_meeting(x + sign(hSpeed), y - j , parSolid))
		 	//	This if statement checks if the player is standing on the ground,has a collision in front of it, but
			//does NOT have a collision j amount of pixels down
        {
			y-=j;								//adjust y position for slope
			i += 0.5 *j;						//increment iterator (effectively lessening total movedistance)
			var _skip	= true;					//skip horizontal adjustment
			onWall		= 0;					//player is not on wall
			onGround	= true;					//player is on ground
			break;								//
		}
	 }
#endregion


#region //MOVING DOWN SLOPE//
	var _maxSlopeDown = max(1, 3 -(floor(abs(hSpeed)/4)));	//This calculates how steep a slope can be declined relative to speed (more speed = less steep)
																//The player will 'stick' to ramps with a slope lower or equal to this value
																//this can be substituted with a static number (higher value means player can decline steeper slopes)
	
	for( j=1; j <= _maxSlopeDown; j++ )						//value here defines how steep a slope can be declined before falling
	 {
		 if (place_meeting(x, y+1, parSolid) && place_meeting(x+sign(hSpeed), y+j+1, parSolid) && !place_meeting(x + sign(hSpeed), y+j , parSolid) && vSpeed+vSpeedFloat > 0)
			//	This if statement checks if the player is standing on the ground and has no collision in front of it, but would still be on the ground if it moved to that position)
        {
			y+=j;								//adjust y position for slope
			i += 0.5*j;							//increment iterator (effectively lessening total movedistance)
			//var _skip = true;					//skip horizontal adjustment
			onWall = 0;							//player is not on wall
			onGround = true;					//player is on ground
			break;								//end loop
		}
	 }
	 
	if (_skip == true)	continue;				//skip changing x position
	
#endregion	


#region //ACTUAL HORIZONTAL MOVEMENT//
    if (!place_meeting(x + sign(hSpeed), y, parSolid))		//if no horizontal collision is detected
        {x += sign(hSpeed);}								//move one pixel in direction of hSpeed
		
    else {													//if a collision IS detected
		hSpeed = 0;											//stop horizontal movement
		hSpeedFloat = 0;									//
        break;												//end loop
    }
	
#endregion

}


#region//Drop fraction if static for certain # of frames
	//checks if hSpeedFloat is the same as last step,and clears it after
	//and clears it after specified number of frames
if (hSpeedFloat != 0 && hSpeedFloat = hFloatLast) hFloatSame ++

if (hFloatSame >= 5)							//value here is number of steps before hFloat is cleared
{												//
	hSpeedFloat	= 0;							//
	hFloatLast	= 0.01;							//this caused issues when set to 0 for some reason, may be unnecessary now
	hFloatSame = 0;								//
}
hFloatLast = hSpeedFloat;						//update hFloatLast

#endregion

//Update onGround after movements
if (onGround) playerAction = "ground";			//helps correct animations on slopes (may be unnecessary now, but unsure)
