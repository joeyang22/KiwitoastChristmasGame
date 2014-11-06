class Missile extends MovieClip
{
	var speed;
	//var tPierce;
	//var pierce;
	function onLoad()
{
	speed = 20;
	//pierce = 0;
	//tPierce = _root.Char.toastPierce/2
}
function onEnterFrame()
{
		if(_root.Char.pButton == 0){
	//tPierce = _root.Char.toastPierce/2
	_x += speed;
	if(_x > 675)
	{
		this.removeMovieClip();
	}
		for(var i in _root.Char.enemies)
		{
			if(this.hitTest( _root.Char.enemies[i] ) )
			{
				//pierce+=1;
				//if (pierce=tPierce)
				//{
				this.removeMovieClip();
				//pierce = 0;
				//}
				_root.Char.enemies[i].explode();
			}
			
		}
	}
}
}