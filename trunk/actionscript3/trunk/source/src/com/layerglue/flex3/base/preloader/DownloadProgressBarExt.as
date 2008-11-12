package com.layerglue.flex3.base.preloader
{
	import com.client.project.temp.Trace;
	import com.client.project.temp.TraceNotifier;
	import com.layerglue.lib.base.collections.EventListenerCollection;
	import com.layerglue.lib.base.events.loader.MultiLoaderEvent;
	import com.layerglue.lib.base.io.FlashVars;
	import com.layerglue.lib.base.io.LoadManager;
	import com.layerglue.lib.base.io.ProportionalLoadManager;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.filters.BlurFilter;
	
	import mx.events.FlexEvent;
	import mx.preloaders.DownloadProgressBar;
	import mx.preloaders.Preloader;

	public class DownloadProgressBarExt extends DownloadProgressBar implements IPreloaderDisplayExt
	{
		
		private var _eventListenerCollection:EventListenerCollection;
		
		public function DownloadProgressBarExt()
		{
			super();
			
			addEventListener(Event.COMPLETE, tempCompleteHandler, false, 0);
			
			filters = [new BlurFilter(0.00001, 0.00001, 1)];
		}
		
		private function tempCompleteHandler(event:Event):void
		{
			trace("DownloadProgressBarExt dispatched complete");
		}
		
		override public function initialize():void
		{
			super.initialize();
			
			FlashVars.initialize(root);
			
			PreloadManager.initialize(this);
			
			_eventListenerCollection = new EventListenerCollection();
			
			_eventListenerCollection.createListener(PreloadManager.getInstance().initialLoadManager, MultiLoaderEvent.ITEM_PROGRESS, loaderChangeHandler);
			_eventListenerCollection.createListener(PreloadManager.getInstance().initialLoadManager, MultiLoaderEvent.ITEM_COMPLETE, loaderChangeHandler);
			
			
			setProgress(0, 0);
			
			minDisplayTime = 3000;
			//MINIMUM_DISPLAY_TIME = 2000;
			trace("minDisplayTime: " + minDisplayTime)
			
			//TraceNotifier.getInstance().dispatchEvent(new Trace("download prog initialize - stageWidth: " + stageWidth + ", stageHeight: " + stageHeight));
			//trace("stageWidth: " + stageWidth + ", stageHeight: " + stageHeight);
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			TraceNotifier.getInstance().dispatchEvent(new Trace("download prog createChildren"));
		}
		
		override protected function showDisplayForDownloading(elapsedTime:int,
											  event:ProgressEvent):Boolean
		{
			return true;
		}
		
		public function get minDisplayTime():Number
		{
			return MINIMUM_DISPLAY_TIME;
		}
		
		public function set minDisplayTime(value:Number):void
		{
			MINIMUM_DISPLAY_TIME = value;
		}
		
		private var _flexPreloader:Preloader
		
		public function get flexPreloader():Preloader
		{
			return _flexPreloader;
		}
		
		override public function set preloader(value:Sprite):void
		{
			//value.addEventListener(FlexEvent.INIT_COMPLETE, initCompleteHandler);
			_flexPreloader = value as Preloader;
			
			_flexPreloader.addEventListener(FlexEvent.PRELOADER_DONE, preloaderDoneTempHandler);
			_flexPreloader.addEventListener(FlexEvent.INIT_COMPLETE, preloaderInitCompleteTempHandler);
			
			super.preloader = value;
			
			//value.removeEventListener(ProgressEvent.PROGRESS, progressHandler);
			//value.removeEventListener(FlexEvent.INIT_PROGRESS, initProgressHandler);
		}
		
		private function preloaderDoneTempHandler(event:Event):void
		{
			trace("preloaderDoneTempHandler");
		}
		
		private function preloaderInitCompleteTempHandler(event:Event):void
		{
			trace("preloaderInitCompleteTempHandler");
		}
		
		protected function initCompleteHandler(event:FlexEvent):void
		{
			//event.stopImmediatePropagation();
			
			//dispatchEvent(new Event(Event.COMPLETE)); 
		}
		
		private function loaderChangeHandler(event:Event):void
		{
			var loadManager:LoadManager = PreloadManager.getInstance().initialLoadManager;
			
			if(loadManager is ProportionalLoadManager)
			{
				setProgress((loadManager as ProportionalLoadManager).currentValue, (loadManager as ProportionalLoadManager).totalValue);
			}
		}
		
		public function startTransitionOut():void
		{
			//triggerComplete();
		}
		
		public function triggerComplete():void
		{
			trace("triggerComplete");
			//dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function destroy():void
		{
			if(_eventListenerCollection)
			{
				_eventListenerCollection.destroy();
			}
			
			if(parent)
			{
				parent.removeChild(this);
			}
		}
	}
}