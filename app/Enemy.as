class Enemy extends MovieClip
{
	var speed;
	var shootTimer;
	var health;
	var eShotMax;
	var damageR;
	function onLoad()
	{
		health = 100
		_x = 700;
		_y = Math.random()*400+75;
		speed = Math.random()*5 + 5;
		shootTimer = 0;
		eShotMax = 30
		if(eShotMax>16){
		eShotMax = 31-_root.Char.level;
		}
		if(eShotMax<15){
		eShotMax = 15;
		}
		//damageR = -20-_root.Char.level
		}
	function onEnterFrame()
		{
				if(_root.Char.pButton == 0){
		shootTimer +=1;
		if(shootTimer > eShotMax)
		{
			shootTimer = 0;
			var missile = _root.attachMovie("EnemyMissile","EnemyMissile" + _root.getNextHighestDepth(), _root.getNextHighestDepth());
			missile._x = _x - 90;
			missile._y = _y - 35;
		}
			_x -= speed;
			if(_x < -100)
			{
				this.removeMovieClip();
			}

		if(this.hitTest(_root.Char))
		{
			_root.Char.updateHealth(-20);
			explode();
		}
		}
		}

		function explode()
		{
			var explosion = _root.attachMovie("Explosion","Explosion" + _root.getNextHighestDepth(),_root.getNextHighestDepth());
			explosion._x = _x;
			explosion._y = _y;
			this.removeMovieClip();
			_root.Char.updateScore(25);
			_root.scoreText = _root.Char.score;
		}
		
}