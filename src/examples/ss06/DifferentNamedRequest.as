package examples.ss06
{
    import examples.SimpleClass;
    
    
    
    // constructor requests shall be located outside class body
    [Inject(name = "constructorValueA", name = "constructorValueB")]
    
    /**
     *  When using named dependencies for constructor injection, the metadata has to be 
     *  placed above the class definition, not above the constructor. This is an unfortunate 
     *  restriction the Flash Player imposes.
     */
    
    public class DifferentNamedRequest
    {
        
        // INJECT INTO VAR
        //-------------------------------------------------------------------------------
        
        [Inject(name = "varValue", optional = true)]
        
        public var varValue:SimpleClass;
        
        /**
         *  varValue returns null, because map doesn't contain satisfying for this request. 
         *  if remove "optional = true", injector will throw an exception with an error, 
         *  because request will be required to satisfy.
         */
        
        
        
        
        // INJECT INTO CONSTRUCTOR
        //-------------------------------------------------------------------------------
        
        private var constructorValueA:String;
        private var constructorValueB:Number;
        
        public function DifferentNamedRequest(valueA:String, valueB:Number)
        {
            constructorValueA = valueA;
            constructorValueB = valueB;
        }
        
        
        
        
        // INJECT INTO METHOD
        //-------------------------------------------------------------------------------
        
        private var methodValueA:SimpleClass;
        private var methodValueB:SimpleClass;
        private var methodValueC:SimpleClass;
        
        [Inject(name = "methodValueA", name = "methodValueB")] 
        public function setMethod(valueA:SimpleClass, valueB:SimpleClass, valueC:SimpleClass):void
        {
            methodValueA = valueA;
            methodValueB = valueB;
            methodValueC = valueC;
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
            trace("optional value from var:", varValue, "\n");
            
            trace("value a from constructor:", constructorValueA);
            trace("value b from constructor:", constructorValueB, "\n");
            
            trace("value a from method:", methodValueA, "id", methodValueA.id);
            trace("value b from method:", methodValueB, "id", methodValueB.id);
            trace("value c from method:", methodValueC, "id", methodValueC.id, "\n");
            
            trace("value from setter:", setterValue, "id", setterValue.id, "\n");
            
            trace("methodValueC === setterValue –", methodValueC === setterValue);
        }
    }
}