using Microsoft.AspNetCore.Mvc;

namespace Q.App.Api.Controllers.v1.Item
{
    public class ItemController : Controller
    {
        private static List<ItemResponseModel> Items = new List<ItemResponseModel>();

        [HttpGet("/v1/item/get")]
        public List<ItemResponseModel> GetAlItems()
        {
            return Items;
        }

        [HttpGet("/v1/item/get{id}")]
        public ItemResponseModel GetItemById(int id)
        {
            var location = Items.Find(l => l.Id == id);

            if (location is not null)
                return location;
            else
                return new ItemResponseModel
                {
                    Id = 0,
                    Name = "",
                    OwnerId = 0,
                    CalculateReplacementDate = false,
                    CategoryId = 0,
                    ConditionId = 0,
                    EstimatedInsuranceUnitValue = 0,
                    ExpectedLifeSpanInYears = 0,
                    LocationId = 0,
                    Notes = "",
                    Quantity = 0,
                    UnitOfMeasureId = 0,
                    UnitPurchaseCost = 0,
                    PurchaseDate = DateOnly.MinValue,
                    EstimatedReplacementDate = DateOnly.MinValue
                };
        }

        [HttpPost("/v1/item/add")]
        public void Add(ItemResponseModel model)
        {
            Items.Add(model);
        }

        [HttpDelete("/v1/item/delete{id}")]
        public ActionResult DeleteItem(int id)
        {
            var itemToRemove = Items.Find(l => l.Id == id);

            if (itemToRemove is not null)
            {
                Items.Remove(itemToRemove);
                return Ok();
            }
            else
            {
                return NotFound($"Unable to locate item with Id: {id}");
            }
        }
    }
}
