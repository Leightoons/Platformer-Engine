/// @desc Camera Setup


cam				= view_camera[0];							//sets 'cam' to refer to viewport camera
follow			= objPlayer;								//sets player as default target

viewWidthHalf	= camera_get_view_width(cam)* 0.5;
viewHeightHalf	= camera_get_view_height(cam)* 0.5;

xTo				= xstart;
yTo				= ystart;
