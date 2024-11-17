using Microsoft.AspNetCore.Mvc;

namespace Q.App.Api.Controllers.v1.Category
{
    public class CategoryController : Controller
    {
        private static List<CategoryResponseModel> Categories = new List<CategoryResponseModel>();

        [HttpGet("/v1/category/get")]
        public List<CategoryResponseModel> GetAllCategories()
        {
            return Categories;
        }

        [HttpGet("/v1/category/get{Id}")]
        public CategoryResponseModel GetCategoryById(int id)
        {
            var category = Categories.Find(l => l.Id == id);

            if (category is not null)
                return category;
            else
                return new CategoryResponseModel { Id = 0, Name = "" };
        }

        [HttpPost("/v1/category/add")]
        public void Add(CategoryResponseModel model)
        {
            Categories.Add(model);
        }

        [HttpDelete("/v1/category/delete{id}")]
        public ActionResult Delete(int id)
        {
            var categoryToRemove = Categories.Find(l => l.Id == id);

            if (categoryToRemove is not null)
            {
                Categories.Remove(categoryToRemove);
                return Ok();
            }
            else
            {
                return NotFound($"Unable to locate the catagory with Id: {id}");
            }
        }
    }
}
