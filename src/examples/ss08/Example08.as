package examples.ss08
{
    import flash.display.Sprite;
    import examples.SimpleClass;
    import org.swiftsuspenders.Injector;
    
    
    
    /**
     * Usage [PostConstruct] and [PreDestroy] metatags (lifecycle management)
     */
    
    public class Example08 extends Sprite
    {
        
        // INJECTION POINT (REQUEST)
        //-------------------------------------------------------------------------------
        
        [Inject] public var simple:SimpleClass;
        
        
        
        
        // CONSTRUCTOR
        //-------------------------------------------------------------------------------
        
        public function Example08()
        {
            var injector:Injector = new Injector();
                injector.map(SimpleClass)
                injector.injectInto(this);
                
            // destroy instance
            injector.destroyInstance(this); // or injector.teardown();
                
            
            /**
             *  output:
             *  
             *  Invoking method number one.
             *  Invoking method number two.
             *  Invoking method number three.
             *  Invoking method number four.
             *  Invoking destroy method number one.
             *  Invoking destroy method number two.
             *  Invoking destroy method number three.
             *  Invoking destroy method number four.
             */
        }
        
        
        
        
        // POST CONSTRUCT
        //-------------------------------------------------------------------------------
        
        
        /** will be invoked first */
        
        [PostConstruct(order = 1)] 
        public function constructMethodOne():void
        {
            trace("Invoking method number one.");
        }
        
        
        
        /** will be invoked second */
        
        [PostConstruct(order = 2)] 
        public function constructMethodTwo():void
        {
            trace("Invoking method number two.");
        }
        
        
        
        /** will be invoked third */
        
        [PostConstruct(order = 3)] 
        public function constructMethodThree():void
        {
            trace("Invoking method number three.");
        }
        
        
        
        /** will be invoked fourth */
        
        [PostConstruct] 
        public function constructMethodFour():void
        {
            trace("Invoking method number four.");
        }
        
        
        
        
        // PRE DESTROY
        //-------------------------------------------------------------------------------
        
        
        /** will be invoked first */
        
        [PreDestroy(order = 1)] 
        public function destroyMethodOne():void
        {
            trace("Invoking destroy method number one.");
        }
        
        
        
        /** will be invoked second */
        
        [PreDestroy(order = 2)] 
        public function destroyMethodTwo():void
        {
            trace("Invoking destroy method number two.");
        }
        
        
        
        /** will be invoked third */
        
        [PreDestroy(order = 3)] 
        public function destroyMethodThree():void
        {
            trace("Invoking destroy method number three.");
        }
        
        
        
        /** will be invoked fourth */
        
        [PreDestroy] 
        public function destroyMethodFour():void
        {
            trace("Invoking destroy method number four.");
        }
    }
}