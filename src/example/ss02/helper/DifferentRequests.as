package example.ss02.helper
{
	public class DifferentRequests
	{
		
		// inject into var
		//--------------------------------------------------------------------------------------
		
		[Inject] public var simpleFromVar:SimpleClass;
		
		
		
		// inject into constructor
		//--------------------------------------------------------------------------------------
		
		private var simpleFromConstructor:SimpleClass;
		
		public function DifferentRequests(value:SimpleClass)
		{
			simpleFromConstructor = value;
		}
		
		
		
		// inject into method
		//--------------------------------------------------------------------------------------
		
		private var simpleFromMethod:SimpleClass;
		
		[Inject] public function setMethod(value:SimpleClass):void
		{
			simpleFromMethod = value;
		}
		
		
		
		// inject into setter
		//--------------------------------------------------------------------------------------
		
		private var simpleFromSetter:SimpleClass;
		
		[Inject] public function set setSetter(value:SimpleClass):void
		{
			simpleFromSetter = value;
		}
		
		
		
		// getInfo
		//--------------------------------------------------------------------------------------
		
		public function getInfo():void
		{
			trace("simpleFromVar:", simpleFromVar);
			trace("simpleFromConstructor:", simpleFromConstructor);
			trace("simpleFromMethod:", simpleFromMethod);
			trace("simpleFromSetter:", simpleFromSetter);
		}
	}
}