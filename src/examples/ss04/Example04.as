package examples.ss04
{
    import flash.display.Sprite;
    import examples.SimpleClass;
    import org.swiftsuspenders.Injector;
    
    
    
    /**
     * Satisfy dependencies using value
     */
    
    public class Example04 extends Sprite
    {
        
        // INJECTION POINTS (REQUEST)
        //-------------------------------------------------------------------------------
        
        [Inject] public var simple:SimpleClass;
        [Inject] public var size:Number;
        [Inject] public var url:String;
        
        
        
        
        // CONSTRUCTOR
        //-------------------------------------------------------------------------------
        
        public function Example04()
        {
            var object:SimpleClass = new SimpleClass();
            
            var injector:Injector = new Injector();
                injector.map(SimpleClass).toValue(object);
                injector.map(String).toValue("https://www.google.com");
                injector.map(Number).toValue(25000);
                injector.injectInto(this);
                
            
            trace("simple:", simple);
            trace("simple === object –", simple === object, "\n");
            
            trace("url:", url);
            trace("size:", size);
            
            
            /**
             *  output:
             *  
             *  simple: [object SimpleClass]
             *  simple === object – true 
             *  
             *  url: https://www.google.com
             *  size: 25000
             *  
             */
        }
    }
}