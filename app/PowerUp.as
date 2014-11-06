class PowerUp extends MovieClip
{
	var speed;
	var type;

	function onLoad()
	{
		speed = 2;
		type = Math.floor(Math.random()*3+1);
		_x = 650;
		_y = Math.random()*200+50;
	}
	function onEnterFrame()
	{
		if(_root.Char.pButton == 0){
		_x -= speed;
		_rotation -= 5;
		if(this.hitTest(_root.Char))
		{		
			if(type == 1)
			{
				_root.powerUp.nextFrame();
				_root.Char.updateHealth(_root.Char.maxHealth - _root.Char.health);
			}
			if(type == 2)
			{
				_root.powerUp.gotoAndStop(2);
				_root.mana = _root.mana-_root.mana + _root.Char.maxMana;
				_root.manaScore = _root.mana;
			}
			if(type == 3)
			{
				_root.PowerUp.gotoAndStop(3);
				_root.Char.updateScore(100);
			}
			this.removeMovieClip();
		}
		if( _x < -30 )
		{
			this.removeMovieClip();
		}
		}
	}
}