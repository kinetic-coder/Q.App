using System.Data;
using MySql.Data.MySqlClient;

namespace Q.App.Api.Models;

public class BaseRepository(IDbConnection dbConnection)
{
    protected readonly MySqlConnection DbConnection = dbConnection;
}