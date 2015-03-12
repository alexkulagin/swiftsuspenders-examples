package examples.ss05
{
    import flash.display.Sprite;
    import examples.ISimpleClass;
    import examples.SimpleClass;
    import org.swiftsuspenders.Injector;
    import org.swiftsuspenders.dependencyproviders.DependencyProvider;
    
    
    
    /**
     * Satisfy dependencies using providers
     */
    
    public class Example05 extends Sprite
    {
        
        // INJECTION POINTS (REQUEST)
        //-------------------------------------------------------------------------------
        
        [Inject] public var simpleA:SimpleClass;
        [Inject] public var simpleB:ISimpleClass;
        
        
        
        
        // CONSTRUCTOR
        //-------------------------------------------------------------------------------
        
        public function Example05()
        {
            var injector:Injector = new Injector();
            var provider:DependencyProvider;
            
            
            
            // FIRST WAY (getProvider)
            //---------------------------------------------------------------------------
            
            /*injector.map(SimpleClass).asSingleton();
            provider = injector.getMapping(SimpleClass).getProvider();
            injector.map(ISimpleClass).toProvider(provider);*/
            
            
            
            // SECOND WAY (toProviderOf)
            //---------------------------------------------------------------------------
            
            /*injector.map(SimpleClass).asSingleton();
            injector.map(ISimpleClass).toProviderOf(SimpleClass);*/
            
            
            
            // THIRD WAY (CustomProvider)
            //---------------------------------------------------------------------------
            
            provider = new CustomProvider();
            injector.map(ISimpleClass).toProvider(provider);
            injector.map(SimpleClass).toProvider(provider);
            
            
            
            // INJECT INTO AND OUTPUT
            //---------------------------------------------------------------------------
            
            injector.injectInto(this);
            trace("simpleA === simpleB –", simpleA === simpleB, "\n");
            
        }
    }
}