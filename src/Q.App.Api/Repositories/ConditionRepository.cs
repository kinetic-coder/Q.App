using System.Data;
using MySql.Data.MySqlClient;
using Q.App.Api.Interfaces;
using Q.App.Api.Models;

namespace Q.App.Api.Repositories;

public class ConditionRepository(MySqlConnection dbConnection) : BaseRepository(dbConnection), IReadDataRepository<Condition>
{
    public List<Condition> Get()
    {
        List<Condition> conditions = new List<Condition>();
        try
        {
            var cmd = new MySqlCommand("sp_get_all_conditions", base.DbConnection);
            cmd.CommandType = CommandType.StoredProcedure;  
            var reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                var tenantId = (Guid)reader["TenantId"];
                var id = (Guid)reader["KitConditionId"];
                var name = reader["ConditionName"].ToString() ?? string.Empty;
                var description = reader["ConditionDescription"].ToString() ?? string.Empty;

                var condition = new Condition()
                {
                    Id = id,
                    Name = name,
                    TenantId = tenantId,
                    Description = description
                };
                conditions.Add(condition);
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e);
            throw;
        }
        return conditions;
    }

    public Condition Get(Guid id)
    {
        throw new NotImplementedException();
    }
}