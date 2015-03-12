package examples.ss01
{
    import flash.display.Sprite;
    import examples.SimpleClass;
    import org.swiftsuspenders.Injector;
    
    
    
    /**
     * Injection into itself and into another class
     */
    
    public class Example01 extends Sprite
    {
        
        // INJECTION POINT (REQUEST)
        //-------------------------------------------------------------------------------
        
        [Inject] public var simple:SimpleClass;
        
        
        
        
        // CONSTRUCTOR
        //-------------------------------------------------------------------------------
        
        public function Example01()
        {
            
            // INJECTOR AND BASIC MAPPING
            //---------------------------------------------------------------------------
            
            var injector:Injector = new Injector();
                injector.map(SimpleClass);
            
            
            
            // INJECTION INTO ITSELF
            //---------------------------------------------------------------------------
            
            trace("\nInjection into itself:");
            
            trace("this.simple:", simple);      // output: null
            injector.injectInto(this);          // inject into this
            trace("this.simple:", simple);      // output: [object SimpleClass]
            
            
            
            // INJECTION INTO ANOTHER CLASS
            //---------------------------------------------------------------------------
            
            trace("\nInjection into another class:");
            
            var custom:CustomObject = new CustomObject();
            
            trace("custom.simple:", custom.simple);         // output: null
            injector.injectInto(custom);                    // inject into custom object
            trace("custom.simple:", custom.simple, "\n");   // output: [object SimpleClass]
        }
    }
}