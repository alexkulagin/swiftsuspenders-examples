package examples.ss13
{
    
    public class SimpleModel
    {
        
        // PRIVATE PROPERTIES
        //-------------------------------------------------------------------------------
        
        private var _score:Number = 0;
        private var _setUpdate:Function;
        private var _setReset:Function;
        
        
        
        
        // SCORE
        //-------------------------------------------------------------------------------
        
        public function get score():Number
        {
            return _score;
        }
        
        
        public function set score(score:Number):void
        {
            trace("│  SimpleModel: \tsave result (before:", _score, "after:", score+")");
            
            _score = score;
            
            if (_score > 0) {
                trace("│  SimpleModel: \tnotify subscriber about new result");
                _setUpdate(_score);
            }
            
            else {
                trace("│  SimpleModel: \tnotify subscriber about reset");
                _setReset();
            }
        }
        
        
        
        
        // HANDLERS
        //-------------------------------------------------------------------------------
        
        public function set setUpdate(value:Function):void
        {
            _setUpdate = value;
        }
        

        public function set setReset(value:Function):void
        {
            _setReset = value;
        }
        
    }
}