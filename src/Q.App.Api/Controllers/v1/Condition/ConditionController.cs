using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using Q.App.Api.Repositories;

namespace Q.App.Api.Controllers.v1.Condition
{
    public class ConditionController : Controller
    {
        private static readonly List<ConditionResponseModel> Conditions = new List<ConditionResponseModel>();

        [HttpGet("/v1/condition/get")]
        public List<Models.Condition> GetAllConditions()
        {
            var connectionString = "Server=localhost;Database=QApp;Uid=root;Pwd=ChangeMeAtDeploymentTime;";
            MySqlConnection db = new MySqlConnection(connectionString);
            db.Open();
            var repo = new ConditionRepository(db);
            List<Models.Condition> conditions;
            try
            {
                conditions = repo.Get();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
            
            return conditions;
        }

        [HttpGet("/v1/condition/get{id}")]
        public ConditionResponseModel GetConditionsById(int id)
        {
            var condition = Conditions.Find(l => l.Id.Equals(id));

            if (condition is not null)
                return condition;
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
            var conditionToRemove = Conditions.Find(l => false);

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
