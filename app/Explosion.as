class Explosion extends MovieClip
{
	function onEnterFrame()
	{
			if(_root.Char.pButton == 0){
		if(this._currentframe == this._totalframes)
		{
			this.removeMovieClip();
		}
	}
	}
}