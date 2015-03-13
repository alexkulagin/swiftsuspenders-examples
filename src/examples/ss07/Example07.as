package examples.ss07
{
    import flash.display.Sprite;
    import flash.utils.getQualifiedClassName;
    import examples.ISimpleClass;
    import examples.SimpleClass;
    import org.swiftsuspenders.Injector;
    
    
    
    /**
     * Type conversion for certain requests
     */
    
    public class Example07 extends Sprite
    {
        
        // INJECTION POINT (REQUEST)
        //-------------------------------------------------------------------------------
        
        [Inject] public var simple:SimpleClass;
        
        [Inject(name = "simpleA")] public var simpleA:SimpleClass;
        [Inject(name = "simpleA")] public var simpleInterfaceA:ISimpleClass;
        
        [Inject(name = "simpleB")] public var simpleB:SimpleClass;
        [Inject(name = "simpleB")] public var simpleInterfaceB:ISimpleClass;
        
        
        
        
        // CONSTRUCTOR
        //-------------------------------------------------------------------------------
        
        public function Example07()
        {
            var injector:Injector = new Injector();
            
            // will instantiate a new SimpleClass for each request for SimpleClass
            injector.map(SimpleClass);
            
            // will instantiate a new SimpleExtendedA for each request for SimpleClass ("name:simpleA")
            injector.map(SimpleClass, "simpleA").toType(SimpleExtendedA);
            
            // will instantiate a new SimpleExtendedA for each request for ISimpleClass ("name:simpleA")
            injector.map(ISimpleClass, "simpleA").toType(SimpleExtendedA);
            
            // will instantiate a new SimpleExtendedB for each request for SimpleClass ("name:simpleB")
            injector.map(SimpleClass, "simpleB").toType(SimpleExtendedB);
            
            // will instantiate a new SimpleExtendedB for each request for ISimpleClass ("name:simpleB")
            injector.map(ISimpleClass, "simpleB").toType(SimpleExtendedB);
            
            
            injector.injectInto(this);
            
            
            trace("simple:", getQualifiedClassName(simple), "\n");
            trace("simpleA:", getQualifiedClassName(simpleA));
            trace("simpleInterfaceA:", getQualifiedClassName(simpleInterfaceA), "\n");
            trace("simpleB:", getQualifiedClassName(simpleB));
            trace("simpleInterfaceB:", getQualifiedClassName(simpleInterfaceB));
            
            
            /**
             *  output:
             *  
             *  simple: examples::SimpleClass
             *  
             *  simpleA: examples.ss07::SimpleExtendedA
             *  simpleInterfaceA: examples.ss07::SimpleExtendedA
             *  
             *  simpleB: examples.ss07::SimpleExtendedB
             *  simpleInterfaceB: examples.ss07::SimpleExtendedB
             */
        }
    }
}