package examples.ss02
{
    import examples.SimpleClass;
    
    

    /**
     *  SwiftSuspenders supports three types of dependency injection:
     *  – Property (field) Injection
     *  – Parameter (method/setter) Injection
     *  – Constructor Injection
     */
    
    public class DifferentRequest
    {
        
        // INJECT INTO VAR
        //-------------------------------------------------------------------------------
        
        [Inject] public var varValue:SimpleClass;
        
        
        
        
        // INJECT INTO CONSTRUCTOR
        //-------------------------------------------------------------------------------
        
        private var constructorValue:SimpleClass;
        
        public function DifferentRequest(value:SimpleClass)
        {
            constructorValue = value;
        }
        
        
        
        
        // INJECT INTO METHOD
        //-------------------------------------------------------------------------------
        
        private var methodValue:SimpleClass;
        
        [Inject] public function setMethod(value:SimpleClass):void
        {
            methodValue = value;
        }
        
        
        
        
        // INJECT INTO SETTER
        //-------------------------------------------------------------------------------
        
        private var setterValue:SimpleClass;
        
        [Inject] public function set setSetter(value:SimpleClass):void
        {
            setterValue = value;
        }
        
        
        
        
        // GET VALUES
        //-------------------------------------------------------------------------------
        
        public function getValues():void
        {
            trace("value from var:", varValue, "id", varValue.id);
            trace("value from constructor:", constructorValue, "id", constructorValue.id);
            trace("value from method:", methodValue, "id", methodValue.id);
            trace("value from setter:", setterValue, "id", setterValue.id);
        }
    }
}