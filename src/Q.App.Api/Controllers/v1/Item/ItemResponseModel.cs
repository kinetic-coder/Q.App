using Q.App.Api.Models;

namespace Q.App.Api.Controllers.v1.Item
{
    public class ItemResponseModel : BaseResponseModel
    {
        public required string Name { get; set; }
        public required int OwnerId { get; set; }
        public required int CategoryId { get; set; }
        public required double Quantity { get; set; }
        public required int UnitOfMeasureId { get; set; }
        public required int ConditionId { get; set; }
        public required string Notes { get; set; }
        public required int LocationId { get; set; }
        public required double EstimatedInsuranceUnitValue { get; set; }
        public DateOnly PurchaseDate { get; set; }
        public required double ExpectedLifeSpanInYears { get; set; }
        public DateOnly EstimatedReplacementDate { get; set; }
        public required bool CalculateReplacementDate { get; set; }
        public required double UnitPurchaseCost { get; set; }

    }
}
