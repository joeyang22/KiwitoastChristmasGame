class EnemyMissile extends MovieClip
{
	var speed;
	var damageZ;
	
	function onLoad()
	{
		speed = -19-_root.Char.level;
		//damageZ = -9-_root.Char.level;
	}
	
	function onEnterFrame()
	{
			if(_root.Char.pButton == 0){
		_x += speed;
	
		if(this.hitTest( _root.Char) )
		{
			this.removeMovieClip();
			_root.Char.updateHealth(-10);
		}
		
		if(_x < 0)
		{
			this.removeMovieClip();
		}
	}
	}
}