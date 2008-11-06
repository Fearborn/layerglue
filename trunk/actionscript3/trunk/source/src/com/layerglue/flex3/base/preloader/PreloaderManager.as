package com.layerglue.flex3.base.preloader
{
	import com.layerglue.lib.base.io.LoadManager;
	import com.layerglue.lib.base.io.LoadManagerToken;
	import com.layerglue.lib.base.io.ProportionalLoadManager;
	import com.layerglue.lib.base.loaders.RootLoaderProxy;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import com.layerglue.lib.base.io.ProportionalLoadManagerToken;
	
	/**
	 * A proxy to sit between the preloader and the main application
	 */
	public class PreloaderManager extends EventDispatcher
	{
		private var _initialLoadManager:LoadManager;
		
		public function PreloaderManager(preloader:IPreloaderDisplayExt)
		{
			super();
			
			_preloaderView = preloader;
			
			_initialLoadManager = new ProportionalLoadManager();
			//_initialLoadManager = new LoadManager();
			
			var item:ProportionalLoadManagerToken = new ProportionalLoadManagerToken(
							new RootLoaderProxy((preloaderView as DisplayObject).root.loaderInfo),
							rootLoadCompleteHandler,
							null,
							0.6);
			
			
			_initialLoadManager.addItem(item);
			_initialLoadManager.start();
		}
		
		/*
		private function createInitialLoadManager():LoadManager
		{
			return new ProportionalLoadManager();
		}
		
		private function createRootLoaderToken():LoadManagerToken
		{
			return new ProportionalLoadManagerToken(
							new RootLoaderProxy((preloaderView as DisplayObject).root.loaderInfo),
							rootLoadCompleteHandler,
							null,
							0.6);
		}
		*/
		
		private static var _instance:PreloaderManager;
		
		public static function initialize(preloader:IPreloaderDisplayExt):PreloaderManager
		{
			if(!_instance)
			{
				_instance = new PreloaderManager(preloader);
			}
			
			return _instance;
		}
		
		public static function getInstance():PreloaderManager
		{
			return _instance;
		}
		
		private var _preloaderView:IPreloaderDisplayExt;
		
		public function get preloaderView():IPreloaderDisplayExt
		{
			return _preloaderView;
		}
		
		public function get initialLoadManager():LoadManager
		{
			return _initialLoadManager;
		}
		
		private function rootLoadCompleteHandler(event:Event):void
		{
		}
	}
}