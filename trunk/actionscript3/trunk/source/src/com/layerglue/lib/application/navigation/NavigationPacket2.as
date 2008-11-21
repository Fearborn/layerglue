package com.layerglue.lib.application.navigation
{
	import flash.events.EventDispatcher;
	import com.layerglue.lib.base.navigation.QueryString;
	import com.layerglue.lib.application.controllers.INavigableController;
	
	public class NavigationPacket2 extends EventDispatcher
	{
		public var controllerStrand:Array;
		public var query:QueryString;
		
		public function NavigationPacket2(controllerStrand:Array, query:QueryString=null)
		{
			super();
			
			this.controllerStrand = controllerStrand;
			this.query = query;
		}
		
		public function getControllerAtDepth(depth:int):INavigableController
		{
			return controllerStrand[int];
		}
		
		public function hasControllerAtDepth(depth:int):Boolean
		{
			return controllerStrand[int] != null;
		}
		
		public function get strandLength():int
		{
			return controllerStrand.length;
		}
		
	}
}