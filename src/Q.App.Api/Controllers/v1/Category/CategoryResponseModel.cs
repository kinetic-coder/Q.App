using Q.App.Api.Models;

namespace Q.App.Api.Controllers.v1.Category
{
    public class CategoryResponseModel : BaseResponseModel
    {
        public required string Name { get; set; }
    }
}
