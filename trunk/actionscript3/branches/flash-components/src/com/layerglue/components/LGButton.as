﻿package com.layerglue.components{	import fl.controls.Button;	import fl.core.InvalidationType;	import fl.core.UIComponent;		import flash.text.AntiAliasType;	import flash.text.TextFieldAutoSize;		public class LGButton extends Button	{		protected var _processAutoWidth:Boolean = true;				private static var defaultStyles:Object = { antiAliasType: null }		public function LGButton()		{			super();		}				public static function getStyleDefinition():Object		{ 			return UIComponent.mergeStyles(Button.getStyleDefinition(), defaultStyles);		}				override public function set width(value:Number):void		{			if (isNaN(value))			{				_processAutoWidth = true;				invalidate(InvalidationType.SIZE);			}			else			{				_processAutoWidth = false;				textField.autoSize = TextFieldAutoSize.NONE;				super.width = value;			}		}				override protected function drawTextFormat():void		{			super.drawTextFormat();						var antiAliasType:String = getStyleValue("antiAliasType") as String;			if (antiAliasType == AntiAliasType.ADVANCED || antiAliasType == AntiAliasType.NORMAL)			{				textField.antiAliasType = antiAliasType;			}		}				override protected function configUI():void		{			super.configUI();		}				override protected function drawLayout():void		{			super.drawLayout();						// Set the component width to match the text field width			if (_processAutoWidth)			{				textField.autoSize = TextFieldAutoSize.LEFT;				var txtPad:Number = Number(getStyleValue("textPadding"));				width = textField.x + textField.width + txtPad;								// Apply the new width to the skin				background.width = width;				background.height = height;			}		}			}}