namespace Baseman;

public static class DateExtensions
{
	public static bool IsBetween(this DateTimeOffset self, DateTimeOffset start, DateTimeOffset end)
		=> self >= start && self < end;

	public static bool IsBetween(this DateTime self, DateTime start, DateTime end)
		=> self >= start && self < end;
}