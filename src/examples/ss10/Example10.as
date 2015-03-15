package examples.ss10
{
    import flash.display.Sprite;
    import org.swiftsuspenders.Injector;
    
    
    
    /**
     * Chaining multiple injectors
     */
    
    public class Example10 extends Sprite
    {
        
        // CONSTRUCTOR
        //-------------------------------------------------------------------------------
        
        public function Example10()
        {
            
            // CONFIGURATION OF THE INJECTORS
            //---------------------------------------------------------------------------
            
            // base injector
            var injector:Injector = new Injector();
                injector.map(String, "version").toValue("705");
                injector.map(String, "color").toValue("white");
                injector.map(Part);
            

            /**
             *  Child Injectors can have their own mappings, complementing 
             *  or overriding the parent mappings.
             */
            
            // injector A
            var childInjectorA:Injector = injector.createChildInjector();
                childInjectorA.map(String, "modification").toValue("A");
            
            // injector B
            var childInjectorB:Injector = injector.createChildInjector();
                childInjectorB.map(String, "modification").toValue("B");
                childInjectorB.map(String, "color").toValue("black");   // override color
            
            
            
            // CONFIGURATION OF THE PARTS
            //---------------------------------------------------------------------------
                
            // creates parts and automatically inject into them injections
            var partA:Part = childInjectorA.getInstance(Part);
            var partB:Part = childInjectorB.getInstance(Part);
            
            
            
            // OUTPUT
            //---------------------------------------------------------------------------
            
            trace("partA:");
            trace("├ version –", partA.version, partA.modification);
            trace("└ color –", partA.color, "\n");
            
            trace("partB:");
            trace("├ version –", partB.version, partB.modification);
            trace("└ color –", partB.color, "\n");
            
            
            /**
             *  output:
             *  
             *  partA:
             *  ├ version – 705 A
             *  └ color – white
             *  
             *  partB:
             *  ├ version – 705 B
             *  └ color – black
             *  
             */
        }
    }
}