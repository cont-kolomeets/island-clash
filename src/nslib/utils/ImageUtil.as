/*
   COPYRIGHT (c) 2013 Kolomeets Aleksandr
   All rights reserved.
   For additional information, contact:
   email: kolomeets@live.ru
 */
package nslib.utils
{
	
	/**
	 * ...
	 * @author Kolomeets A. V., Russia, Novosibirsk, 2012.
	 */
	public class ImageUtil
	{
		public static function scaleToFitHeight(image:*, height:Number, expand:Boolean = false):void
		{
			var ratio:Number = image.height / height;
			
			if (expand || ratio > 1)
			{
				image.scaleX = 1 / ratio;
				image.scaleY = 1 / ratio;
			}
		}
		
		public static function scaleToFitWidth(image:*, width:Number, expand:Boolean = false):void
		{
			var ratio:Number = image.width / width;
			
			if (expand || ratio > 1)
			{
				image.scaleX = 1 / ratio;
				image.scaleY = 1 / ratio;
			}
		}
	
	}

}