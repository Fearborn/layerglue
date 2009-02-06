package com.layerglue.flex3.base.applications
{
	import mx.core.Application;

	public class PreloadableApplication extends Application implements IPreloadableApplication
	{
		public function PreloadableApplication()
		{
			super();
		}
		
		private var _loadManager:Class;
		
		/**
		 * @inheritDoc
		 */
		[Inspectable(defaultValue="com.layerglue.lib.base.io.ProportionalLoadManager")]
		public function get loadManager():Class
		{
			return _loadManager;
		}
		
		public function set loadManager(value:Class):void
		{
			_loadManager = value;
		}
		
		private var _preloaderMinDisplayTime:Number
		
		/**
		 * @inheritDoc
		 */
		[Inspectable(defaultValue="0")]
		public function get preloaderMinDisplayTime():Number
		{
			return _preloaderMinDisplayTime;
		}
		
		public function set preloaderMinDisplayTime(value:Number):void
		{
			_preloaderMinDisplayTime = value;
		}
		
		private var _loadManagerTotalValue:Number
		
		/**
		 * @inheritDoc
		 */
		[Inspectable(defaultValue="1")]
		public function get loadManagerTotalValue():Number
		{
			return _loadManagerTotalValue;
		}
		
		public function set loadManagerTotalValue(value:Number):void
		{
			_loadManagerTotalValue = value;
		}
		
		private var _loadManagerMainSWFValue:Number;
		
		/**
		 * @inheritDoc
		 */
		[Inspectable(defaultValue="0.6")]
		public function get loadManagerMainSWFValue():Number
		{
			return _loadManagerMainSWFValue;
		}
		
		public function set loadManagerMainSWFValue(value:Number):void
		{
			_loadManagerMainSWFValue = value;
		}
		
	}
}