package example.ss01
{
	import flash.display.Sprite;
	import org.swiftsuspenders.Injector;
	
	public class ExampleSS01 extends Sprite
	{
		// injection point
		[Inject] public var simple:SimpleClass;
		
		public function ExampleSS01()
		{
			var injector:Injector = new Injector();
			injector.map(SimpleClass);	// create a basic mapping
			
			trace(simple); 				// output: null
			injector.injectInto(this);	// injection into itself
			trace(simple); 				// output: [object SimpleClass]
		}
	}
}