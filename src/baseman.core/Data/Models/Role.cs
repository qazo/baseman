namespace Baseman.Data.Models;

public class Role
{
    public short Id { get; set; } 
    public required string Name { get; set; }
    public required string Description { get; set; }
}