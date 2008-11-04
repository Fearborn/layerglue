package com.layerglue.lib.base.loaders
{
	import com.layerglue.lib.base.collections.EventListenerCollection;
	
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;

	public class RootLoaderProxy extends EventDispatcher implements IMeasurableLoader
	{
		private var _rootLoaderInfo:LoaderInfo;
		private var _eventListenerCollection:EventListenerCollection;
		
		public function RootLoaderProxy(rootLoaderInfo:LoaderInfo)
		{
			super();
			
			_rootLoaderInfo = rootLoaderInfo;
			
			_eventListenerCollection = new EventListenerCollection();
			_eventListenerCollection.createListener(_rootLoaderInfo, ProgressEvent.PROGRESS, progressHandler);
			_eventListenerCollection.createListener(_rootLoaderInfo, Event.COMPLETE, completeHandler);
			
		}
		
		private function progressHandler(event:ProgressEvent):void
		{
			dispatchEvent(event.clone());
		}
		
		private function completeHandler(event:Event):void
		{
			dispatchEvent(event.clone());
		}
		
		public function open():void
		{
		}
		
		public function close():void
		{
		}
		
		public function isComplete():Boolean
		{
			return false;
		}
		
		public function getBytesLoaded():uint
		{
			return _rootLoaderInfo.bytesLoaded;
		}
		
		public function getBytesTotal():uint
		{
			return _rootLoaderInfo.bytesTotal;
		}
		
	}
}