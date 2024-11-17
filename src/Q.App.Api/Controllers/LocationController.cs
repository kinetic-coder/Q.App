using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Q.App.Api.Models;

namespace Q.App.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LocationController : ControllerBase
    {
        private static List<LocationResponsetModel> Locations = new List<LocationResponsetModel>();

        public LocationController()
        {
            
        }

        [HttpGet("all")]
        public List<LocationResponsetModel> GetLocations()
        {
            return LocationController.Locations;
        }

        [HttpGet("byId")]
        public LocationResponsetModel GetLocation(int id)
        {
            var location = LocationController.Locations.Find(l => l.Id == id);

            if (location is not null)
                return location;
            else
                return new LocationResponsetModel();
        }

        [HttpPost("add")]
        public void Add(LocationResponsetModel model)
        {
            Locations.Add(model);
        }

        [HttpDelete("delete")]
        public bool Delete(int id)
        {
            var locationToRemove = Locations.Find(l => l.Id == id);

            if(locationToRemove is not null)
            {
                LocationController.Locations.Remove(locationToRemove);
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
