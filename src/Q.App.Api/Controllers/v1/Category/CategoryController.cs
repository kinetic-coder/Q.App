using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using Q.App.Api.Repositories;

namespace Q.App.Api.Controllers.v1.Category
{
    public class CategoryController : Controller
    {
        private static List<CategoryResponseModel> _categories = new List<CategoryResponseModel>();

        [HttpGet("/v1/category/get")]
        public List<Models.Category> GetAllCategories()
        {
            var connectionString = "Server=localhost;Database=QApp;Uid=root;Pwd=ChangeMeAtDeploymentTime;";
            MySqlConnection db = new MySqlConnection(connectionString);
            db.Open();
            var repo = new CategoryRepository(db);
            List<Models.Category> categories;
            try
            {
                categories = repo.GetCategories();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
            
            return categories;
        }

        [HttpGet("/v1/category/get{Id}")]
        public CategoryResponseModel GetCategoryById(int id)
        {
            var category = _categories.Find(l => l.Id.Equals(id));

            if (category is not null)
                return category;
            else
                return new CategoryResponseModel { Id = Guid.NewGuid(), Name = "" };
        }

        [HttpPost("/v1/category/add")]
        public void Add(CategoryResponseModel model)
        {
            _categories.Add(model);
        }

        [HttpDelete("/v1/category/delete{id}")]
        public ActionResult Delete(int id)
        {
            var categoryToRemove = _categories.Find(l => l.Id.Equals(id));

            if (categoryToRemove is not null)
            {
                _categories.Remove(categoryToRemove);
                return Ok();
            }
            else
            {
                return NotFound($"Unable to locate the catagory with Id: {id}");
            }
        }
    }
}
