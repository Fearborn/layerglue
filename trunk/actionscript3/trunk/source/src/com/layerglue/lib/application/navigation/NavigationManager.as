package com.layerglue.lib.application.navigation
{
	import com.asual.swfaddress.SWFAddress;
	import com.asual.swfaddress.SWFAddressEvent;
	
	import flash.events.EventDispatcher;
	import com.layerglue.lib.application.requests.RawNavigationRequest;
	
	public class NavigationManager extends EventDispatcher
	{
		public function NavigationManager()
		{
			super();
			
			initializeSWFAddress()
		}
		
		private static var _instance:NavigationManager;
		
		public static function getInstance():NavigationManager
		{
			if(!_instance)
			{
				_instance = new NavigationManager();
			}
			
			return _instance;
		}
		
		private function initializeSWFAddress():void
		{
			trace("NavigationManager.initializeSWFAddress");
			SWFAddress.addEventListener(SWFAddressEvent.CHANGE, swfAddressChangeHandler);
		}
		
		private function swfAddressChangeHandler(event:SWFAddressEvent):void
		{
			//Create new style navpackets here
			trace("NavigationManager.swfAddressChangeHandler");	
		}
		
		public function processRawNavigation(uri:String):void
		{
			trace("NavigationManager.processRawNavigation: " + uri);
		}

	}
}