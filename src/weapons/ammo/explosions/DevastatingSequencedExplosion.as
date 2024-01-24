/*
   COPYRIGHT (c) 2013 Kolomeets Aleksandr
   All rights reserved.
   For additional information, contact:
   email: kolomeets@live.ru
 */
package weapons.ammo.explosions
{
	import constants.WeaponContants;
	import controllers.WeaponController;
	import nslib.controls.NSSprite;
	import nslib.effects.explosions.BurnPit;
	import nslib.effects.traceEffects.TracableObject;
	import nslib.effects.traceEffects.TraceController;
	import nslib.utils.NSMath;
	import supportClasses.WeaponType;
	import weapons.ammo.bullets.CannonBullet;
	
	/**
	 * ...
	 * @author Kolomeets A. V., Russia, Novosibirsk, 2012.
	 */
	public class DevastatingSequencedExplosion extends SequencedExplosion
	{
		
		public function DevastatingSequencedExplosion(container:NSSprite, traceController:TraceController)
		{
			super(container, traceController);
		}
		
		private var params:Object = new Object();
		private var afterTraceParams:Object = new Object();
		
		override public function explode(x:int, y:int, strength:int = 5):void
		{
			super.explode(x, y, strength);
			
			var fragmentsCoverRadius:int = strength * 30;
			
			for (var i:int = 0; i < strength * 3; i++)
			{
				params.radius = NSMath.min(strength * NSMath.random(), 3);
				params.x = x;
				params.y = y;
				params.hitPower = WeaponContants.CANNON_BULLET_HIT_POWER;
				params.type = WeaponType.USER;
				params.isFromExplosion = true;
				
				afterTraceParams.radius = params.radius;

				var bullet:TracableObject = traceController.launchTracableObject(CannonBullet, params, x + fragmentsCoverRadius / 2 - fragmentsCoverRadius * NSMath.random(), y + fragmentsCoverRadius / 2 - fragmentsCoverRadius * NSMath.random(), 3 + 5 * NSMath.random(), BurnPit, afterTraceParams);
				
				CannonBullet(bullet).hitPower = strength * 5;
				WeaponController.registerFlyingBullet(CannonBullet(bullet));
			}
		}
	
	}

}