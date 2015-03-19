package examples.ss12
{
    import flash.display.Sprite;
    import org.swiftsuspenders.Injector;
    
    
    
    /**
     * Defining soft mappings
     */
    
    public class Example12 extends Sprite
    {
        
        // INJECTION POINT (REQUEST)
        //-------------------------------------------------------------------------------
        
        [Inject] public var message:String;
        
        
        
        
        // CONSTRUCTOR
        //-------------------------------------------------------------------------------
        
        public function Example12()
        {
            
            var grandfather:Injector = new Injector();
                grandfather.map(String).toValue("message from grandfather");
            
            var father:Injector = grandfather.createChildInjector();
                father.map(String).softly().toValue("message from father");
                
            var son:Injector = father.createChildInjector();
                son.map(String).softly().toValue("message from son");
                
            var child:Injector = son.createChildInjector();
                child.map(String).softly().toValue("message from child");
            
            
            child.injectInto(this);
            
            trace(message);
            
            
            /**
             *  From example:
             *  
             *  output: message from grandfather
             *  
             *  1 strong mapping → child → son → father → grandfather → found
             *  
             *  
             *  For this case:
             * 
             *  grandfather:Injector = new Injector();
             *  father:Injector = grandfather.createChildInjector();
             *  son:Injector = father.createChildInjector();
             *  child:Injector = son.createChildInjector();
             *  child.map(String).softly().toValue("message from child");
             *  
             *  output: message from child
             *  
             *  1 strong mapping → child → son → father → grandfather → not found
             *  2 soft mapping → grandfather → father → son → child → found
             *  
             */
        }
    }
}