package examples.ss10
{
    public class Part
    {
        
        // INJECTION POINTS (REQUEST)
        //-------------------------------------------------------------------------------
        
        [Inject(name = "version")] 
        public var version:String;
        
        [Inject(name = "modification")] 
        public var modification:String;
        
        [Inject(name = "color")] 
        public var color:String;
        
    }
}