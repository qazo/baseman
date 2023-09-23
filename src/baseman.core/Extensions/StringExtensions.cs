namespace Baseman;


public static class StringExtensions
{
	public static string Limit(this string self, int length)
	{
		if (self.Length <= length) {
			return self;
		}
		return self[0..length];
	}
}
