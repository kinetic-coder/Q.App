using MySql.Data.MySqlClient;

namespace Q.App.Api.Repositories;

public class BaseRepository(MySqlConnection dbConnection)
{
    protected readonly MySqlConnection DbConnection = dbConnection;
}