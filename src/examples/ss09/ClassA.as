package examples.ss09
{
    import examples.SimpleClass;

    
    
    /**
     * Helper simple class A
     */
    
    public class ClassA extends SimpleClass
    {
        
        // INJECTION POINT (REQUEST)
        //-------------------------------------------------------------------------------
        
        [Inject] public var simple:ClassB;
        
        
        
        // POST CONSTRUCT
        //-------------------------------------------------------------------------------
        
        [PostConstruct] public function init():void
        {
            send("I'm " + String(this) + " and I can see " + String(simple));
        }
    }
}