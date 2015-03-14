package examples.ss09
{
    import examples.SimpleClass;

    
    
    /**
     * Helper simple class B
     */
    
    public class ClassB extends SimpleClass
    {
        
        // INJECTION POINT (REQUEST)
        //-------------------------------------------------------------------------------
        
        [Inject] public var simple:ClassC;
        
        
        
        // POST CONSTRUCT
        //-------------------------------------------------------------------------------
        
        [PostConstruct] public function init():void
        {
            send("I'm " + String(this) + " and I can see " + String(simple));
        }
    }
}