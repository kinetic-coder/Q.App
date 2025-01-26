using System.Data;
using Q.App.Api.Interfaces;
using Q.App.Api.Models;

namespace Q.App.Api.Repositories;

public class CategoryRepository(IDbConnection dbConnection) : BaseRepository(dbConnection), IReadDataRepository<Category>
{
    public List<Category> GetCategories()
    {
        
        try
        {   
            
        }
    }

    public Category GetCategory(Guid id)
    {
        throw new NotImplementedException();
    }
}