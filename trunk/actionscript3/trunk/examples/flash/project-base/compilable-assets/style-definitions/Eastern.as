	package
{
	import com.layerglue.flash.styles.LGStyleCollection;
	
	import fl.managers.StyleManager;
	
	import flash.system.Security;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.TextFormat;

	public class Eastern extends LGStyleCollection
	{
		[Embed(source="../images/trees.jpg")]
		public static var testImage:Class;
		
		public function Eastern()
		{
			super();
			Security.allowDomain("*");
		}
		
		override protected function registerFonts():void
		{
			
		}
		
		override protected function defineStyles():void
		{
			StyleManager.setStyle( "textFormat", new TextFormat("_sans", 12, 0xFF3300, false) );
			StyleManager.setStyle( "antiAliasType", AntiAliasType.ADVANCED);
			StyleManager.setStyle( "embedFonts", false );
		}
		
		override protected function defineAssets():void
		{
			addAsset("testImage", testImage);
		}
		
	}
}