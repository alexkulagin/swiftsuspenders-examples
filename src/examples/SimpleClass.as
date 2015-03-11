package examples
{
    /**
     * Helper simple class
     */
    
    public class SimpleClass implements ISimpleClass
    {
        private static var _counter:uint;
        private var _id:uint;
        
        public function SimpleClass()
        {
            _id = ++_counter;
            // trace("Created SimpleClass", _id);
        }
        
        public function send(message:String):void
        {
            trace("SimpleClass", id, "send message:", message);
        }
        
        public function get id():uint
        {
            return _id;
        }
    }
}