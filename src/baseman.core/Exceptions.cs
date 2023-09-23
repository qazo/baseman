using System.Runtime.Serialization;

namespace Baseman;

public class BasemanException : Exception
{
    public BasemanException()
    {
    }

    public BasemanException(string? message) : base(message)
    {
    }

    public BasemanException(string? message, Exception? innerException) : base(message, innerException)
    {
    }

    protected BasemanException(SerializationInfo info, StreamingContext context) : base(info, context)
    {
    }
}
