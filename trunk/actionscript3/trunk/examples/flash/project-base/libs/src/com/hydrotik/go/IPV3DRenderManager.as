package com.hydrotik.go {
	import org.goasap.interfaces.ILiveManager;	
		
		function reserve(handler : IRenderable) : void;
		
		function release(handler : IRenderable) : void;
		
		function onUpdate(pulseInterval : int, handlers : Array, currentTime : Number) : void;