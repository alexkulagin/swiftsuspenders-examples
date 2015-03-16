package examples.ss13
{
    import flash.display.Sprite;
    import flash.display.Stage;
    import flash.events.Event;
    
    import org.swiftsuspenders.Injector;
    
    
    
    /**
     * Simple example of model & controller
     */
    
    public class Example13 extends Sprite
    {
        
        // PRIVATE PROPERTIES
        //-------------------------------------------------------------------------------
        
        private var _injector:Injector;
        
        
        
        
        // CONSTRUCTOR
        //-------------------------------------------------------------------------------
        
        public function Example13()
        {
            stage ? init() : addEventListener(Event.ADDED_TO_STAGE, init); 
        }
        
        
        private function init(event:Event = null):void
        {
            event && stage.removeEventListener(Event.ADDED_TO_STAGE, init);
            
            
            // configure
            _injector = new Injector();
            _injector.map(Stage).toValue(stage);
            _injector.map(Injector).toValue(_injector.createChildInjector());
            _injector.map(SimpleController).asSingleton();
            _injector.map(SimpleModel).asSingleton();
            
            
            // creates and launches simple controller
            _injector.getInstance(SimpleController);
            
        }
    }
}