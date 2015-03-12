package examples.ss01
{
    import examples.SimpleClass;

    public class CustomObject
    {
        
        // INJECTION POINT (REQUEST)
        //-------------------------------------------------------------------------------
        
        [Inject] public var simple:SimpleClass;
        
        
        
        
        // CONSTRUCTOR
        //-------------------------------------------------------------------------------
        
        public function CustomObject()
        {
            //
        }
    }
}