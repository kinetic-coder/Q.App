using Q.App.Api.Models;

namespace Q.App.Api.Interfaces;

public interface IReadDataRepository <TResult>
{
    List<TResult> GetCategories();
    TResult GetCategory(Guid id);
}