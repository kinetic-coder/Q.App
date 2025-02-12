namespace Q.App.Api.Tools;

public class Tools
{
    public Guid ConvertBinaryToGuid(string binary)
    {
        return Guid.Parse(binary);
    }
}