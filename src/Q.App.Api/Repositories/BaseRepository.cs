using System.Data;

namespace Q.App.Api.Models;

public class BaseRepository(IDbConnection dbConnection)
{
    private IDbConnection _dbConnection = dbConnection;
}