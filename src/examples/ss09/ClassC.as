package examples.ss09
{
    import examples.SimpleClass;

    
    
    /**
     * Helper simple class C
     */
    
    public class ClassC extends SimpleClass
    {
        
        // POST CONSTRUCT
        //-------------------------------------------------------------------------------
        
        [PostConstruct] public function init():void
        {
            send("I'm " + String(this) + " and I don't see anything.");
        }
    }
}