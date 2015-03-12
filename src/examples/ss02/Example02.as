package examples.ss02
{
    import flash.display.Sprite;
    import examples.SimpleClass;
    import org.swiftsuspenders.Injector;
    
    
    
    /**
     * Injection into var, setter, method and constructor
     */
    
    public class Example02 extends Sprite
    {
        
        // CONSTRUCTOR
        //-------------------------------------------------------------------------------
        
        public function Example02()
        {
            var injector:Injector = new Injector();
                injector.map(DifferentRequest);
                injector.map(SimpleClass);
                
            // creates an instance DifferentRequests and automatically injects into it injections
            var custom:DifferentRequest = injector.getInstance(DifferentRequest) as DifferentRequest;
                custom.getValues();
            
            /**
             *  getValues output:
             *  
             *  value from var: [object SimpleClass] id 2
             *  value from constructor: [object SimpleClass] id 1
             *  value from method: [object SimpleClass] id 4
             *  value from setter: [object SimpleClass] id 3
             *  
             */
        }
    }
}