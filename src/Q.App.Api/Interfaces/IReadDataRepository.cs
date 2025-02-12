using Q.App.Api.Models;

namespace Q.App.Api.Interfaces;

public interface IReadDataRepository <TResult>
{
    List<TResult> Get();
    TResult Get(Guid id);
}