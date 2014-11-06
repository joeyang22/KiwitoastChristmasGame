class BackgroundA extends MovieClip
{
function onEnterFrame()
{
	if(_root.Char.pButton == 0){
	_x -= 2;
	if(_x < -786
	   )
	{
		_x = 0;
	}
}
}
}