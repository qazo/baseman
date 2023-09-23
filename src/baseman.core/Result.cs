namespace Baseman;

public record Result(string Message, bool Success)
{
	public static Result AsSuccess()
		=> new(Message: "Success.", Success: true);

	public static Result AsSuccess(string message)
		=> new(Message: message, Success: true);

	public static Result AsError(string message)
		=> new(Message: message, Success: false);

	public static Result AsError(BasemanException ex)
		=> new(Message: ex.Message, Success: false);

	public static Result<TValue> AsSuccess<TValue>(TValue value)
		=> new(Message: "Success.", Success: false, Value: value);

	public static Result<TValue> AsSuccess<TValue>(string message, TValue value)
		=> new(Message: message, Success: false, Value: value);

	public static Result<TValue> AsError<TValue>(string message)
		=> new(Message: message, Success: false, Value: default);

	public static Result<TValue> AsError<TValue>(BasemanException ex)
		=> new(Message: ex.Message, Success: false, Value: default);
}

public record Result<TValue>(string Message, bool Success, TValue? Value);
