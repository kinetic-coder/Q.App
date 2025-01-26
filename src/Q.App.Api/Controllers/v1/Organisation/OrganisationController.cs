using Microsoft.AspNetCore.Mvc;

namespace Q.App.Api.Controllers.v1.Organisation
{
    public class OrganisationController : Controller
    {
        private static List<OrganisationResponseModel> Organisations = new List<OrganisationResponseModel>();

        [HttpGet("/v1/organisation/get")]
        public List<OrganisationResponseModel> Get()
        {
            return Organisations;
        }

        [HttpGet("/v1/organisation/get{id}")]
        public OrganisationResponseModel Get(int id)
        {
            var organisation = Organisations.Find(l => l.Id.Equals(id));

            if (organisation is not null)
                return organisation;
            else
                return new OrganisationResponseModel { Id = Guid.NewGuid(), Name = "" };
        }

        [HttpPost("/v1/organisation/add")]
        public void Add(OrganisationResponseModel model)
        {
            Organisations.Add(model);
        }

        [HttpDelete("/v1/organisation/delete{id}")]
        public ActionResult Delete(int id)
        {
            var locationToRemove = Organisations.Find(l => l.Id.Equals(id));

            if (locationToRemove is not null)
            {
                Organisations.Remove(locationToRemove);
                return Ok();
            }
            else
            {
                return NotFound($"Unable to locate the organisation with Id: {id}");
            }
        }
    }
}
