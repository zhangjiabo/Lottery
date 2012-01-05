package utils
{
	import flash.display.DisplayObject;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.utils.Timer;
	
	public class FlashAction
	{
		private var flashNum:int = 0;
		private var glowFilterFlashTimer:Timer = new Timer(500);
		private var glowFiltersArray:Array = [];
		
		private var warningFiltersArray:Array = [];
		private var repairingFiltersArray:Array = [];
		private var resetFiltersArray:Array = [];
		private var defaultFiltersArray:Array = [];
		private var darkFilterArray:Array = [];
		
		private static const CAMERAEASENUM:int = 10;
		
		
		public function FlashAction()
		{
			
//			var color:Number = 0xF7931D;
			var color:Number = 0xFFFFFF;
			var warningColor:Number = 0x990000;
			var repairingColor:Number = 0xF7931D;
			var defaultColor:Number = 0xFFFFFF;
			var darkColor:Number = 0x000000;
			var alpha:Number = 0.5;
			var blurX:Number = 5;
			var blurY:Number = 5;
			var strength:Number = 5;
			var inner:Boolean = true;
			var knockout:Boolean = false;
			var quality:Number = BitmapFilterQuality.HIGH;
			glowFiltersArray = [new GlowFilter(color,alpha,blurX,blurY,strength,quality,inner,knockout)];
			warningFiltersArray = [new GlowFilter(warningColor,alpha,blurX,blurY,strength,quality,inner,knockout)];
			repairingFiltersArray = [new GlowFilter(repairingColor,0.8,35,35,strength,quality,inner,knockout)];
//			defaultFiltersArray = [new GlowFilter(defaultColor,alpha,2,2,1,quality,inner,knockout)];
			defaultFiltersArray = [new DropShadowFilter(8)];
			darkFilterArray = [new GlowFilter(warningColor,alpha,blurX,blurY,strength,quality,inner,knockout)];
//			windowOpenRotateTime.addEventListener(TimerEvent.TIMER,onWindowOpenRotate);
//			windowCloseRotateTime.addEventListener(TimerEvent.TIMER,onWindowCloseRotate);
		}
		
		public function flashComponent(component:DisplayObject):void
		{
			component.filters = repairingFiltersArray;
		}
		public function warningCube(selectedCabinetLayer:DisplayObject):void
		{
			selectedCabinetLayer.filters = warningFiltersArray;
		}
		public function repairingCube(selectedCabinetLayer:DisplayObject):void
		{
			selectedCabinetLayer.filters = repairingFiltersArray;
		}
		public function resetComponent(component:DisplayObject):void
		{
			component.filters = resetFiltersArray;
		}
		public function setDefaultComponent(component:DisplayObject):void
		{
			component.filters = glowFiltersArray;
		}
		public function darkComponent(component:DisplayObject):void
		{
			component.filters = darkFilterArray;
		}
	}
}