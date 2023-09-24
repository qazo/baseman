namespace Baseman.Data.Models;

public class User
{
	public int Id { get; set; }
	public required string Username { get; set; }
	public required string PasswordHash { get; set; }
	public UserStatus Status { get; set; }
	public DateTimeOffset CreatedAt { get; set; }
	public DateTimeOffset UpdatedAt { get; set; }
}