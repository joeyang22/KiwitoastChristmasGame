class Char extends MovieClip {
	var velocity;
	var shootLimiter;
	var bombLimiter;
	var enemyTimer;
	var enemies;
	var score;
	var health;
	var maxHealth;
	var maxMana;
	var expLimit;
	var powerupTimer;
	var enemyHP;
	var maxShot;
	var high;
	var level;
	var enemyMax;
	var damage;
	var sPoints;
	var toastPierce;
	var pButton;
	function onLoad() {
		enemyMax = 30;
		high = 0;
		pButton = 0;
		powerupTimer = 0;
		velocity = 10;
		shootLimiter = 0;
		enemyTimer = 0;
		enemies = [];
		expLimit = 100;
		health = 100;
		maxMana = 100;
		maxHealth = 100;
		bombLimiter = 0;
		maxShot = 10;
		score = 0;
		level = 1;
		_root.expToLevel = expLimit;
		_root.levelUpMenu._visible = false;
		_root.levelText = level;
		_root.scoreText = score;
		_root.healthMeter = maxHealth;
		_root.gameOverMenu._visible = false;
		_root.gameOverMenu.playAgainButton.onPress = function() {
			_root.Char.newGame();
			_root.Char.maxShot = 10;
			_root.Char.velocity = 10;
		};
	}
	function onEnterFrame() {
	if (pButton == 0){
		if (score>=expLimit) {
			score = expLimit;
			_root.scoreText = score;
			_root.levelUpMenu._visible = true;
		}
		powerupTimer += 1;
		if (powerupTimer>300) {
			powerupTimer = 0;
			var powerup = _root.attachMovie("PowerUp", "PowerUp"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
		}
		if (_visible == true) {
			enemyTimer += 1;
			if (enemyTimer>enemyMax) {
				enemyTimer = 0;
				var enemycount = _root.attachMovie("Enemy", "Enemy"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
				enemies.push(enemycount);
			}
			shootLimiter += 1;
			bombLimiter += 1;
			if (Key.isDown(Key.RIGHT)) {
				_x = _x+velocity;
				if (_x>=525) {
					_x = _x-velocity;
				}
			}
			if (Key.isDown(Key.LEFT)) {
				_x = _x-velocity;
				if (_x<=0) {
					_x = _x+velocity;
				}
			}
			if (Key.isDown(Key.UP)) {
				_y = _y-velocity;
				if (_y<=0) {
					_y = _y+velocity;
				}
			}
			if (Key.isDown(Key.DOWN)) {
				_y = _y+velocity;
				if (_y>=350) {
					_y = _y+-velocity;
				}
			}
			if (Key.isDown(Key.SPACE) && shootLimiter>maxShot) {
				shootLimiter = 0;
				var missile = _root.attachMovie("Missile", "Missile"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
				missile._x = _x+150;
				missile._y = _y+50;
			}
			if (Key.isDown(Key.CONTROL) && bombLimiter>15 && _root.mana>=25) {
				_root.mana -= 25;
				_root.manaScore = _root.mana;
				bombLimiter = 0;
				var bomb = _root.attachMovie("Bomb", "Bomb"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
				bomb._x = _x+150;
				bomb._y = _y+50;
			}
		}
	}
	}
	function takeDamage(damage, ind) {
		_root.Char.enemyHp[ind]-100;
		if (_root.Char.enemyHP[ind]<1) {
			explode();
		}
	}
	function resetScore() {
		score = 0;
		level = 0;
		_root.scoreText = score;
	}
	function updateScore(points) {
		score += points;
		_root.scoreText = score;
	}
	function updateHealth(points) {
		health += points;
		if (health<1) {
			health = 0;
			_root.gameOverMenu._visible = true;
			if (level>high) {
				high = level;
			}
			_root.gameOverMenu.hScore = high;
			explode();
		}
		_root.healthMeter = health;
	}
	function resetHealth() {
		health = 100;
		_root.healthMeter = 100;
	}
	function explode() {
		this._visible = false;
		var explosion = _root.attachMovie("Explosion", "Explosion"+_root.getNextHighestDepth(), _root.getNextHighestDepth());
		explosion._x = _x;
		explosion._y = _y;
		for (var i in enemies) {
			enemies[i].explode();
		}
	}
	function newGame() {
		this._visible = true;
		_root.gameOverMenu._visible = false;
		resetHealth();
		resetScore();
		level = 1;
		_root.levelText = level;
		_root.levelUpMenu._visible = false;
		expLimit = 100;
		maxMana = 100;
		_root.mana = maxMana;
		maxHealth = 100;
		health = maxHealth;
		_root.manaScore = _root.mana;
		_root.healthMeter = health;
		_root.expToLevel = expLimit;
	}
	function levelUp() {
		expLimit += 100;
		level += 1;
		_root.levelText = level;
	}
}
