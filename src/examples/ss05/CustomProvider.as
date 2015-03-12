package examples.ss05
{
    import flash.utils.Dictionary;
    import org.swiftsuspenders.Injector;
    import org.swiftsuspenders.dependencyproviders.DependencyProvider;
    
    
    
    /**
     * Custom provider - can intercept mapping and make instance substitution
     */
    
    public class CustomProvider implements DependencyProvider
    {   
        public function apply(targetType:Class, activeInjector:Injector, injectParameters:Dictionary):Object
        {
            return null;
        }
        
        public function destroy():void
        {
        }
    }
}