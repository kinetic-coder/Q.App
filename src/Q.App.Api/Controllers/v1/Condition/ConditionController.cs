using Microsoft.AspNetCore.Mvc;

namespace Q.App.Api.Controllers.v1.Condition
{
    public class ConditionController : Controller
    {
        private static List<ConditionResponseModel> Conditions = new List<ConditionResponseModel>();

        [HttpGet("/v1/condition/get")]
        public List<ConditionResponseModel> GetAllConditions()
        {
            return Conditions;
        }

        [HttpGet("/v1/condition/get{id}")]
        public ConditionResponseModel GetConditionsById(int id)
        {
            var Condition = Conditions.Find(l => l.Id.Equals(id));

            if (Condition is not null)
                return Condition;
            else
                return new ConditionResponseModel { Id = Guid.NewGuid(), Name = "" };
        }

        [HttpPost("/v1/condition/add")]
        public void AddCondition(ConditionResponseModel model)
        {
            Conditions.Add(model);
        }

        [HttpDelete("/v1/condition/delete{id}")]
        public ActionResult DeleteCondition(int id)
        {
            var conditionToRemove = Conditions.Find(l => l.Id.Equals(id));

            if (conditionToRemove is not null)
            {
                Conditions.Remove(conditionToRemove);
                return Ok();
            }
            else
            {
                return NotFound($"Unable to locate the condition with Id: {id}");
            }
        }
    }
}
