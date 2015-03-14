package examples.ss09
{
    import flash.display.Sprite;
    
    import org.swiftsuspenders.Injector;
    
    
    
    /**
     * Chain of injection
     */
    
    public class Example09 extends Sprite
    {
        
        // INJECTION POINT (REQUEST)
        //-------------------------------------------------------------------------------
        
        [Inject] public var simpleA:ClassA;
        
        
        
        
        // CONSTRUCTOR
        //-------------------------------------------------------------------------------
        
        public function Example09()
        {
            var injector:Injector = new Injector();
                injector.map(ClassA).asSingleton();
                injector.map(ClassB).asSingleton();
                injector.map(ClassC).asSingleton();
                
            
            injector.injectInto(this);
            
            
            /**
             *  output:
             *  
             *  SimpleClass 3 send message: I'm [object ClassC] and I don't see anything.
             *  SimpleClass 2 send message: I'm [object ClassB] and I can see [object ClassC]
             *  SimpleClass 1 send message: I'm [object ClassA] and I can see [object ClassB]
             */
        }
    }
}