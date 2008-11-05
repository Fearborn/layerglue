package com.client.project.preloader
{
	import com.layerglue.flex3.base.preloader.AbstractPreloaderView;
	import com.layerglue.flex3.base.preloader.PreloaderManager;
	import com.layerglue.lib.base.collections.EventListenerCollection;
	import com.layerglue.lib.base.events.loader.MultiLoaderEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import com.layerglue.lib.base.io.ProportionalLoadManager;

	public class PreloaderView extends AbstractPreloaderView
	{
		private var _eventListenerCollection:EventListenerCollection;
		
		private var _progressBar:Sprite;
		private var _barWidth:Number;
		private var _barHeight:Number;
		private var _barBorderThickness:Number;
		
		public function PreloaderView()
		{
			super();
			
			_barWidth = 500;
			_barHeight = 10;
			_barBorderThickness = 1;
		}
		
		override public function initialize():void
		{
			super.initialize();
			
			_eventListenerCollection = new EventListenerCollection();
			
			_eventListenerCollection.createListener(PreloaderManager.getInstance().initialLoadManager, MultiLoaderEvent.ITEM_PROGRESS, loaderChangeHandler);
			_eventListenerCollection.createListener(PreloaderManager.getInstance().initialLoadManager, MultiLoaderEvent.ITEM_COMPLETE, loaderChangeHandler);
			_eventListenerCollection.createListener(stage, Event.RESIZE, stageSizeChangeHandler);
			
			_progressBar = new Sprite();
			addChild(_progressBar);
			
			drawProgress();
			reposition();
		}
		
		protected function loaderChangeHandler(event:Event):void
		{
			drawProgress();
		}
		
		private function stageSizeChangeHandler(event:Event):void
		{
			reposition();
		}
		
		private function drawProgress():void
		{
			if(_progressBar)
			{
				//var castLoadManager:ProportionalLoadManager = PreloaderManager.getInstance().initialLoadManager as ProportionalLoadManager;
				
				_progressBar.graphics.lineStyle(1, 0xCCCCCC, 1);
				_progressBar.graphics.beginFill(0x666666, 1);
				_progressBar.graphics.drawRect(0, 0, _barWidth, _barHeight);
				_progressBar.graphics.endFill()
				
				_progressBar.graphics.beginFill(0xCCCCCC, 1);
				_progressBar.graphics.drawRect(_barBorderThickness, _barBorderThickness, (_barWidth-(_barBorderThickness*2)) * PreloaderManager.getInstance().initialLoadManager.currentValue, (_barHeight-(_barBorderThickness*2)));
				_progressBar.graphics.endFill()
				
			}
		}
		
		private function reposition():void
		{
			if(_progressBar)
			{
				_progressBar.x = Math.round(stageWidth/2 - _progressBar.width/2);
				_progressBar.y = Math.round(stageHeight/2 - _progressBar.height/2);
			}
		}
	}
}