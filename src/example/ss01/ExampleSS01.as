package example.ss01
{
	import flash.display.Sprite;
	import org.swiftsuspenders.Injector;
	import example.ss01.helper.CustomClass;
	import example.ss01.helper.SimpleClass;
	
	public class ExampleSS01 extends Sprite
	{
		// injection point (request)
		[Inject] public var simple:SimpleClass;
		
		public function ExampleSS01()
		{
			// injector
			var injector:Injector = new Injector();
			
			// basic mapping
			injector.map(SimpleClass);
			
			
			// inject into itself
			trace(simple); 					// output: null
			injector.injectInto(this);
			trace(simple, "\n"); 			// output: [object SimpleClass]
			
			
			// inject into custom
			var custom:CustomClass = new CustomClass();
			
			trace(custom.simple); 			// output: null
			injector.injectInto(custom);
			trace(custom.simple); 			// output: [object SimpleClass]
		}
	}
}