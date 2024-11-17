using Q.App.Api.Models;

namespace Q.App.Api.Controllers.v1.Condition
{
    public class ConditionResponseModel : BaseResponseModel
    {
        public required string Name { get; set; }
    }
}
