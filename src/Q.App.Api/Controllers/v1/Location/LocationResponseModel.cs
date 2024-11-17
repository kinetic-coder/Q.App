using Q.App.Api.Models;

namespace Q.App.Api.Controllers.v1.Location
{
    public class LocationResponseModel : BaseResponseModel
    {
        public required string Description { get; set; }
    }
}
