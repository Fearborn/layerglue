/**
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	
	import org.goasap.interfaces.IManageable;
	import org.goasap.items.LinearGo;
	/**
		
		/**
		
		//Getters & Setters	
		public function set target(target:SoundChannel):void 
		/**
		/**
		public function set panTo(value:Number):void 
		/**
		public function set panStart(value:Number):void
		
		//Overridden methods
		override public function start():Boolean 
		override protected function onUpdate(type:String):void 
		
		// IManageable implementation
		public function getActiveProperties():Array 
		public function isHandling(properties:Array):Boolean 
		public function releaseHandling(...params):void 