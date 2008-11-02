package com.layerglue.flex3.base.collections.strategies
{
	import com.layerglue.lib.base.collections.strategies.DeserializerCollectionStrategyMap;
	
	import mx.collections.ArrayCollection;

	public class FlexCollectionStrategyMap extends DeserializerCollectionStrategyMap
	{
		public function FlexCollectionStrategyMap()
		{
			super();
			
			addItem(ArrayCollection, new ArrayCollectionStrategy());
		}
	}
}