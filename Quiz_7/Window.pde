public static class Window
{
    public static int windowWidth = 1280;
    public static int windowHeight = 720;
    public static int windowHalfWidth = windowWidth / 2;
    public static int windowHalfHeight = windowHeight / 2;
    public static float eyeZ = -(windowHeight/2.0) / tan(PI*30.0 / 180.0);
    
    public static float left = -windowHalfWidth;
    public static float right = windowHalfWidth;
    public static float top = windowHalfHeight;
    public static float bottom = -windowHalfHeight;
}
