using Microsoft.AspNetCore.Mvc;

namespace Q.App.Api.Controllers.v1.Location
{
    [Route("api/[controller]")]
    [ApiController]
    public class LocationController : ControllerBase
    {
        private static List<LocationResponseModel> Locations = new List<LocationResponseModel>();

        [HttpGet("/v1/location/get")]
        public List<LocationResponseModel> GetAll()
        {
            return Locations;
        }

        [HttpGet("/v1/location/get{id}")]
        public LocationResponseModel GetById(int id)
        {
            var location = Locations.Find(l => l.Id == id);

            if (location is not null)
                return location;
            else
                return new LocationResponseModel { Id = 0, Description = "" };
        }

        [HttpPost("/v1/location/add")]
        public void Add(LocationResponseModel model)
        {
            Locations.Add(model);
        }

        [HttpDelete("/v1/location/delete{id}")]
        public ActionResult Delete(int id)
        {
            var locationToRemove = Locations.Find(l => l.Id == id);

            if (locationToRemove is not null)
            {
                Locations.Remove(locationToRemove);
                return Ok();
            }
            else
            {
                return NotFound($"Unable to locate location with Id: {id}");
            }
        }
    }
}
