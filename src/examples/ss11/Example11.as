package examples.ss11
{
    import flash.display.Sprite;
    import org.swiftsuspenders.Injector;
    
    
    
    /**
     * Defining local and shared scope for mappings
     */
    
    public class Example11 extends Sprite
    {
        
        // CONSTRUCTOR
        //-------------------------------------------------------------------------------
        
        public function Example11()
        {
            
            var injector:Injector = new Injector();
                injector.map(String, "TestStringA").toValue("test string a");
                injector.map(String, "TestStringB").locally().toValue("test string b");
            
            /**
             *  locally() - disables sharing the mapping with child Injectors 
             *  of the Injector it is defined in.
             */
            
            
            var childInjector:Injector = injector.createChildInjector();
            
            trace("– injectorChild has access to 'TestStringA':", childInjector.hasMapping(String, "TestStringA"));
            trace("– injectorChild has access to 'TestStringB':", childInjector.hasMapping(String, "TestStringB"));
            
            
            /**
             *  output:
             *  
             *  – injectorChild has access to 'TestStringA': true
             *  – injectorChild has access to 'TestStringB': false
             *  
             */
        }
    }
}