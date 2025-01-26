using Microsoft.AspNetCore.Mvc;

namespace Q.App.Api.Controllers.v1.UnitOfMeasure
{
    public class UnitOfMesureController : Controller
    {
        private static readonly List<UnitOfMeasureResponseModel> UnitOfMeasures = new List<UnitOfMeasureResponseModel>();

        [HttpGet("/v1/unitOfMeasure/get")]
        public List<UnitOfMeasureResponseModel> GetAllUnitOfMeasures()
        {
            return UnitOfMeasures;
        }

        [HttpGet("/v1/unitOfMeasure/get{id}")]
        public UnitOfMeasureResponseModel GetUnitOfMeasureById(int id)
        {
            var unitOfMeasure = UnitOfMeasures.Find(l => l.Id.Equals(id));

            if (unitOfMeasure is not null)
                return unitOfMeasure;
            else
                return new UnitOfMeasureResponseModel { Id = Guid.NewGuid(), Name = "" };
        }

        [HttpPost("/v1/unitOfMeasure/add")]
        public void Add(UnitOfMeasureResponseModel model)
        {
            UnitOfMeasures.Add(model);
        }

        [HttpDelete("/v1/unitOfMeasure/delete{id}")]
        public ActionResult Delete(int id)
        {
            var unitOfMeasureToRemove = UnitOfMeasures.Find(l => l.Id.Equals(id));

            if (unitOfMeasureToRemove is not null)
            {
                UnitOfMeasures.Remove(unitOfMeasureToRemove);
                return Ok();
            }
            else
            {
                return NotFound($"Unable to locate the Unit of measure with Id: {id}");
            }
        }
    }
}
