using System.Data;
using MySql.Data.MySqlClient;
using Q.App.Api.Interfaces;
using Q.App.Api.Models;

namespace Q.App.Api.Repositories;

public class CategoryRepository(IDbConnection dbConnection) : BaseRepository(dbConnection), IReadDataRepository<Category>
{
    public List<Category> GetCategories()
    {
        List<Category> categories = new List<Category>();
        try
        {
            var cmd = new MySqlCommand("get_all_categories", base.DbConnection);
            cmd.CommandType = CommandType.StoredProcedure;  
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                var category = new Category();
                
                category.Id = (Guid)reader["KitCategoryId"];
                category.Name = reader["KitCategoryName"].ToString() ?? string.Empty;
                category.TenantId = (Guid)reader["TenantId"];
                categories.Add(category);
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e);
            throw;
        }
    }

    public Category GetCategory(Guid id)
    {
        throw new NotImplementedException();
    }
}