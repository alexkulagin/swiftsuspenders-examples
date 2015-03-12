package examples.ss03
{
    import flash.display.Sprite;
    import examples.ISimpleClass;
    import examples.SimpleClass;
    import org.swiftsuspenders.Injector;
    
    
    
    /**
     * Satisfy dependencies using singleton
     */
    
    public class Example03 extends Sprite
    {
        
        // INJECTION POINTS (REQUEST)
        //-------------------------------------------------------------------------------
        
        // class implementation
        [Inject] public var simpleA:SimpleClass;
        [Inject] public var simpleB:SimpleClass;
        
        // interface implementation
        [Inject] public var simpleC:ISimpleClass;
        [Inject] public var simpleD:ISimpleClass;
        
        
        
        
        // CONSTRUCTOR
        //-------------------------------------------------------------------------------
        
        public function Example03()
        {
            var injector:Injector = new Injector();
                injector.map(SimpleClass).asSingleton();
                injector.map(ISimpleClass).toSingleton(SimpleClass);
                injector.injectInto(this);
            
            trace("simpleA.id:", simpleA.id);
            trace("simpleB.id:", simpleB.id, "\n");
            
            trace("simpleC.id:", simpleC.id);
            trace("simpleD.id:", simpleD.id, "\n");
            
            trace("simpleA === simpleB –", simpleA === simpleB);
            trace("simpleC === simpleD –", simpleC === simpleD, "\n");
            
            trace("simpleA === simpleC –", simpleA === simpleC);
            trace("simpleB === simpleD –", simpleB === simpleD, "\n");
            
            
            /**
             *  output:
             *  
             *  simpleA.id: 2
             *  simpleB.id: 2
             *  
             *  simpleC.id: 1
             *  simpleD.id: 1
             *  
             *  simpleA === simpleB – true
             *  simpleC === simpleD – true
             *  
             *  simpleA === simpleC – false
             *  simpleB === simpleD – false
             *  
             */
        }
    }
}