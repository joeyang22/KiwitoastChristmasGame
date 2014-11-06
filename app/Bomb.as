class Bomb extends MovieClip
{
var speed;
	function onLoad()
{
	speed = 20;
}
	function onEnterFrame(){	
		if(_root.Char.pButton == 0){
	_x += speed;
	if(_x > 675)
	{
		this.removeMovieClip();
	}
		for(var i in _root.Char.enemies)
		{
			if(this.hitTest( _root.Char.enemies[i] ) )
			{
				_root.Char.enemies[i].explode();
			}
			
		}
	}
	}
}