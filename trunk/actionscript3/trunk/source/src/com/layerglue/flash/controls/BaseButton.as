package com.layerglue.flash.controls 
{
	import com.layerglue.flash.constants.ButtonPhase;
	import com.layerglue.flash.views.SpriteExt;
	import com.layerglue.lib.base.events.EventListener;
	
	import flash.events.MouseEvent;

	/**
	 * @author Jamie Copeland
	 */
	public class BaseButton extends SpriteExt
	{
		
		public function BaseButton()
		{
			super();
			
			enabled = true;
			
			addEventListeners();
			
			setPhase(ButtonPhase.UP);
		}
		
		private var _enabled:Boolean;
		
		public function get enabled():Boolean
		{
			return _enabled;
		}
		
		public function set enabled(value:Boolean):void
		{
			_enabled = value;
			invalidateState();
		}
		
		protected var _selected:Boolean;
		
		public function get selected():Boolean
		{
			return _selected;
		}
		
		public function set selected(value:Boolean):void
		{
			_selected = value;
			invalidateState();
		}

		protected var _phase:String;
		
		public function get phase():String
		{
			return _phase;
		}
		
		protected function setPhase(value:String):void
		{
			_phase = value;
			invalidateState();
		}
		
		protected function addEventListeners():void
		{
			removeEventListeners();
			
			addEventListener(MouseEvent.ROLL_OVER, rollOverHandler, false, 0, true);
			addEventListener(MouseEvent.ROLL_OUT, rollOutHandler, false, 0, true);
			addEventListener(MouseEvent.MOUSE_DOWN, pressHandler, false, 0, true);
			addEventListener(MouseEvent.MOUSE_UP, releaseHandler, false, 0, true);
		}
		
		protected function removeEventListeners():void
		{
			removeEventListener(MouseEvent.ROLL_OVER, rollOverHandler, false);
			removeEventListener(MouseEvent.ROLL_OUT, rollOutHandler, false);
			removeEventListener(MouseEvent.MOUSE_DOWN, pressHandler, false);
			removeEventListener(MouseEvent.MOUSE_UP, releaseHandler, false);
		}
		
		protected function rollOverHandler(event:MouseEvent):void
		{
			setPhase(ButtonPhase.OVER);
		}
		
		protected function rollOutHandler(event:MouseEvent):void
		{
			if(phase == ButtonPhase.OVER)
			{
				setPhase(ButtonPhase.UP);
			}
		}
		
		protected function pressHandler(event:MouseEvent):void
		{
			setPhase(ButtonPhase.DOWN);
			addStageListener();
		}
		
		protected function releaseHandler(event:MouseEvent):void
		{
			setPhase(ButtonPhase.OVER);
		}
		
		protected function stageReleaseHandler(event:MouseEvent):void
		{
			removeStageListener();
			
			//Check for release outside
			if(phase != ButtonPhase.OVER)
			{
				setPhase(ButtonPhase.UP);
			}
		}
		
		protected var _stageListener:EventListener;
		
		protected function addStageListener():void
		{
			_stageListener = new EventListener(stage, MouseEvent.MOUSE_UP, stageReleaseHandler, false, 0, true);
		}
		
		protected function removeStageListener():void
		{
			if(_stageListener)
			{
				_stageListener.destroy();
				_stageListener = null;
			}
		}
		
		protected function invalidateState():void
		{
		}
		
	}
}