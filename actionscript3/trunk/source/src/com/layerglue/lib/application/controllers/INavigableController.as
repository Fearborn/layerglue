package com.layerglue.lib.application.controllers
{
	import com.layerglue.lib.application.structure.IStructuralData;
	import com.layerglue.lib.application.views.INavigableView;

	import flash.display.DisplayObjectContainer;
	import flash.events.IEventDispatcher;

	[Bindable]
	public interface INavigableController extends IEventDispatcher
	{
		/**
		 * The structural data for this view.
		 */
		function get structuralData():IStructuralData
		function set structuralData(value:IStructuralData):void
		
		/**
		 * Returns whether or not this is a root-level (primary) controller
		 */
		function isRoot():Boolean
		
		function get viewClassReference():Class
		function set viewClassReference(value:Class):void
		
		/**
		 * The container in which to create this controller's view, defaulting to the parent
		 * controller's view's childViewContainer.
		 */
		function get viewContainer():DisplayObjectContainer
		function set viewContainer(value:DisplayObjectContainer):void
		
		/**
		 * Returns an instance of this controller instance's view
		 */
		function get view():INavigableView
		function set view(value:INavigableView):void
		
		/**
		 * Returns the parent controller of this instance
		 */
		function get parent():INavigableController
		function set parent(value:INavigableController):void
		
		/**
		 * Returns a list of child controllers contained by this instance
		 */
		function get children():Array
		function set children(value:Array):void
		
		/**
		 * Returns the depth of this instance within the controller hierarchy
		 */
		function get depth():uint
		
		/**
		 * Which one of the child controllers is selected
		 */
		function get selectedChild():INavigableController;
		
		function createView():void
		
		function destroyView():void;
		
		function getChildByUriNode(string:String):INavigableController;
		function getChildById(string:String):INavigableController;
		
		function navigate():void;
		function unnavigate():void;
		
	}
}