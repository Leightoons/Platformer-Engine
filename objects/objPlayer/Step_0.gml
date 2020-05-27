
//Get input
GetKeyboardInput()

//Execute Player State Script
script_execute(playerState);


//Reset Squash and Stretch
xScale = Approach(xScale, imageScale, reformSpeed);
yScale = Approach(yScale, imageScale, reformSpeed);

