package examples.ss13
{
    import flash.display.Stage;
    import flash.events.KeyboardEvent;
    import flash.ui.Keyboard;
    
    import org.swiftsuspenders.Injector;
    
    
    
    /**
     * Simple example of model & controller
     */
    
    public class SimpleController
    { 
        
        // INJECTION POINTS (REQUEST)
        //-------------------------------------------------------------------------------
        
        [Inject] public function set stage(value:Stage):void
        {
            _stage = value;
        }
        
        
        [Inject] public function set injector(value:Injector):void
        {
            _injector = value;
        }
        
        
        [Inject] public function set model(value:SimpleModel):void
        {
            _model = value;
        }
        
        
        
        
        // PRIVATE PROPERTIES
        //-------------------------------------------------------------------------------
        
        private var _stage:Stage;
        private var _injector:Injector;
        private var _model:SimpleModel;
        
        
        
        
        // POST CONSTRUCT
        //-------------------------------------------------------------------------------
        
        [PostConstruct] public function postConstructInitialize():void
        {
            _model.setUpdate = onScoreUpdateHandler;
            _model.setReset = onScoreResetHandler;
            _stage.addEventListener(KeyboardEvent.KEY_DOWN, updateScore);
            
            
            trace("┌────────────────────────────────────┐\n│");
            trace("│  #1 controller is ready");
            trace("│  #2 model is ready");
            trace("│\n└─>>>  please press key \"U\" ╳╳╳╳╳╳\n");
        }
        
        
        
        
        // KEYBOARD HANDLER
        //-------------------------------------------------------------------------------
        
        private function updateScore(event:KeyboardEvent):void
        {
            if (event.keyCode == Keyboard.U) 
            {
                trace("\n\nUPDATE MODEL:");
                trace("├──>>>⊗─────────────────────────────────────────────────────────────────────────────┐\n│");
                trace("│  SimpleController: \tcalculates a score and sends result to in the model.");
                _model.score = _model.score + int(Math.random() * 1000); // update model
                trace("│\n└───────────────────────────────────────────────────────────────────────────────────┘");
            }
            
            if (event.keyCode == Keyboard.R) 
            {
                
                if (_model.score > 0) {
                    trace("\n\nRESET MODEL:");
                    trace("├──>>>⊗─────────────────────────────────────────────────────────────────────────────┐\n│");
                    trace("│  SimpleController: \tresets score in the model.");
                    _model.score = 0; // update model
                    trace("│\n└───────────────────────────────────────────────────────────────────────────────────┘");
                }
                    
                else trace("│\n└──>>>⊗  please press key \"U\" for update");
            }
        }
        
        
        
        
        // MODEL HANDLERS
        //-------------------------------------------------------------------------------
        
        private function onScoreUpdateHandler(score:Number):void
        {
            trace("│  SimpleController: \thears on changes of model:");
            trace("│\t\t\t│\n│\t\t\t└─>>>  new result", score, " (please press key \"R\" for reset)");
        }
        
        
        private function onScoreResetHandler():void
        {
            trace("│  SimpleController: \thears on changes of model:");
            trace("│\t\t\t│\n│\t\t\t└─>>>  new result", _model.score, "(please press key \"U\" for update)");
        }
    }
}