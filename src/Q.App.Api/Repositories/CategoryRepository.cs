using System.Data;
using MySql.Data.MySqlClient;
using Q.App.Api.Interfaces;
using Q.App.Api.Models;

namespace Q.App.Api.Repositories;

public class CategoryRepository(MySqlConnection dbConnection) : BaseRepository(dbConnection), IReadDataRepository<Category>
{
    public List<Category> Get()
    {
        List<Category> categories = new List<Category>();
        try
        {
            var cmd = new MySqlCommand("sp_get_all_categories", base.DbConnection);
            cmd.CommandType = CommandType.StoredProcedure;  
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                var categoryTenantId = (Guid)reader["TenantId"];
                var categoryId = (Guid)reader["KitCategoryId"];
                var categoryName = reader["CategoryName"].ToString() ?? string.Empty;
                var description = reader["CategoryDescription"].ToString() ?? string.Empty;

                var category = new Category()
                {
                    Id = categoryId,
                    Name = categoryName,
                    TenantId = categoryTenantId,
                    Description = description
                };
                categories.Add(category);
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e);
            throw;
        }
        return categories;
    }

    public Category Get(Guid id)
    {
        throw new NotImplementedException();
    }
}