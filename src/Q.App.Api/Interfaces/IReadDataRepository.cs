using Q.App.Api.Models;

namespace Q.App.Api.Interfaces;

public interface IReadDataRepository <TResult>
{
    List<TResult> GetCategories { get; }
    TResult GetCategory(Guid id);
}