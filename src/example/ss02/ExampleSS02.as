package example.ss02
{
	import flash.display.Sprite;
	import example.ss02.helper.SimpleClass;
	import example.ss02.helper.DifferentRequests;
	import org.swiftsuspenders.Injector;
	
	public class ExampleSS02 extends Sprite
	{
		public function ExampleSS02()
		{
			var injector:Injector = new Injector();
				injector.map(SimpleClass);
				injector.map(DifferentRequests);
			
			// creates DifferentRequests and automatically injects into it injections
			var custom:DifferentRequests = injector.getInstance(DifferentRequests) as DifferentRequests;
				custom.getInfo();
				
			/**
			 *	getInfo outputs:
			 *	simpleFromVar: [object SimpleClass]
			 *	simpleFromConstructor: [object SimpleClass]
			 *	simpleFromMethod: [object SimpleClass]
			 *	simpleFromSetter: [object SimpleClass]
			 */
		}
	}
}
