package examples.ss06
{
    import flash.display.Sprite;
    import examples.SimpleClass;
    import org.swiftsuspenders.Injector;
    
    
    
    /**
     * Named and optional injection requests
     */
    
    public class Example06 extends Sprite
    {
        
        // CONSTRUCTOR
        //-------------------------------------------------------------------------------
        
        public function Example06()
        {
            var injector:Injector = new Injector();
                injector.map(String, "constructorValueA").toValue("some messages");
                injector.map(Number, "constructorValueB").toValue(240000);
                injector.map(SimpleClass, "methodValueA");
                injector.map(SimpleClass, "methodValueB");
                injector.map(SimpleClass).asSingleton();
            
            
            // creates an instance of DifferentNamedRequest and injects into it
            var custom:DifferentNamedRequest = injector.instantiateUnmapped(DifferentNamedRequest) as DifferentNamedRequest;
                custom.getValues();
            
            /**
             *  getValues output:
             *  
             *  optional value from var: null 
             *  
             *  value a from constructor: some messages
             *  value b from constructor: 240000 
             *  
             *  value a from method: [object SimpleClass] id 2
             *  value b from method: [object SimpleClass] id 3
             *  value c from method: [object SimpleClass] id 1 
             *  
             *  value from setter: [object SimpleClass] id 1 
             *  
             *  methodValueC === setterValue – true
             *  
             */
        }
    }
}