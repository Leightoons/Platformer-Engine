/// @desc ApplyVertical() 

//Apply Vertical Movements and Collisions//


//Convert vSpeed to usable integer and store fraction
	#region //Expand for explanation
	//	Objects cannot move LESS than one pixel, since x and y positions are integers,
	//so we store the leftover fraction after the decimal point and add it back to the
	//total each step/frame before removing the new fractional remainder.
	
	//	This way, we can simulate speeds in between integers.
	//For example, if our vSpeed is 4.5, the 0.5 will be removed and stored and the player will
	//move 4 pixels that step.
	//	On the NEXT step, the 0.5 will be added back into vSpeed,
	//giving us a total of 5. Since there is nothing left over, the next step will be rounded down
	//to 4 again, but the remainder will be stored again and this cycle will continue.
	
	//	This cycle of switching between moving 4 and 5 pixels each step gives the illusion
	//that the player is moving 4.5 pixels per second.
	#endregion

vSpeed += vSpeedFloat;		//add stored fraction
vSpeedFloat = frac(vSpeed); //store new leftover fraction
vSpeed -= vSpeedFloat;		//remove fraction, leaving integer


//Vertical Movements and Collisions
for (i = 0; i < abs(vSpeed); i++)												//MOVEMENT/COLLISION CHECK LOOP
																					//	This loop moves the player one pixel at a time, then checks
																					//for a collision, and if nothing is in the way, it continues to
																					//loop until it has reached it's movement speed
{
    if (!place_meeting(x, y + sign(vSpeed), parSolid))							//if no vertical collision is detected
		{y += sign(vSpeed)}														//move one pixel in direction of vSpeed
    else																		//if a collision IS detected
	{
		//Squash and stretch upon landing								
		if (vSpeed > 4) {xScale = imageScale * 1.3; yScale = imageScale * 0.65;}	//if vSpeed is great enough, apply squash and stretch
		if (vSpeed > 0) {onGround = true;}										//set player's onGround status to true
		
		//Stop movement
        vSpeed = 0;																//stop vertical movement
		vSpeedFloat = 0;														//
        break;																	//end loop
    }
}

//Horiz has a system for discarding unnecessary fractional speed, but Vertical works fine without it for now
