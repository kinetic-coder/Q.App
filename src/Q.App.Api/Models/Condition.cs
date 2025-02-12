namespace Q.App.Api.Models;

public class Condition : TenantModel
{
    public required string Name { get; set; }
    public required string Description { get; set; }
    public DateTime CreatedOn { get; set; }
    public DateTime UpdatedOn { get; set; }
}