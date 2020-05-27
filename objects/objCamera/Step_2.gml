/// @desc Update Camera

//Update Destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

//Keep camera destination within room
xTo = clamp(xTo, viewWidthHalf, room_width - viewWidthHalf);
yTo = clamp(yTo, viewHeightHalf, room_height - viewHeightHalf);

//Update Object Position
x += (xTo - x)/1;
y += (yTo - y)/1;



//Keep camera within room
x = clamp(x, viewWidthHalf, room_width - viewWidthHalf);
y = clamp(y, viewHeightHalf, room_height - viewHeightHalf);

//Set actual camera position
camera_set_view_pos(cam,x - viewWidthHalf,y - viewHeightHalf);