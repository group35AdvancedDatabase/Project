using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using Oracle.ManagedDataAccess.Client;
using System.Configuration;

/// <summary>
/// Summary description for RecipeDataAccessClass
/// </summary>
public class RecipeDataAccessClass
{
    public RecipeDataAccessClass()
    {
    }
    string connectionString = ConfigurationManager.ConnectionStrings["RecipeDatabaseConnectionString"].ConnectionString;
    //SqlConnection con;
    //SqlCommand cmd;
    //SqlDataReader reader;

    OracleConnection con;
    OracleCommand cmd;
    OracleDataReader reader;
    DataTable dataTable = new DataTable();

    public DataTable GetCategoryList()
    {
        string query = "SELECT CATEGORY_ID,CATEGORY_NAME  FROM AOD_CATEGORY";

        return GetDataTable(query);
    }

    public DataTable GetCuisineList()
    {
        string query = "select AOD_CUISINE.CUISINE_ID, AOD_CUISINE.CUISINE_NAME from AOD_CUISINE";

        return GetDataTable(query);
    }

    //public DataTable GetDataTable(String query)
    //{
    //    con = new SqlConnection(connectionString);
    //    cmd = new SqlCommand(query, con);

    //    cmd.Connection.Open();

    //    reader = cmd.ExecuteReader();
    //    DataTable dataTable = new DataTable();
    //    dataTable.Load(reader);

    //    cmd.Connection.Close();
    //    cmd.Connection.Dispose();

    //    return dataTable;
    //}
    public DataTable GetDataTable(String query)
    {
        OracleConnection conn = new OracleConnection(connectionString);
        conn.Open();
        OracleCommand cmd = conn.CreateCommand();
        cmd.CommandText = query;
        cmd.CommandType = CommandType.Text;

        reader = cmd.ExecuteReader();

        //DataSet ds = new DataSet();
        //OracleDataAdapter adapter = new OracleDataAdapter(cmd);
        //adapter.Fill(ds);
        DataTable dataTable = new DataTable();
        dataTable.Load(reader);
        cmd.Connection.Close();
        conn.Close();

        return dataTable;
    }

    public string CreateOrUpdateRecipe(int recipeId, string recipeName, int categoryId, string cookingTime, string portion, int cusineId,
                  string description, int? isPrivate)
    {
       /* con = new SqlConnection(connectionString);

        //Create SqlCommand object
        cmd = new SqlCommand("sp_AOD_RECIPE_Insert_Update", con);

        //Get the updated rows from the gridview and update parameters of the stored procedure
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@RECIPE_ID", recipeId);
        cmd.Parameters.AddWithValue("@RECIPE_NAME", recipeName);

        //if (userId == 0)
        //{
        cmd.Parameters.AddWithValue("@USER_ID", DBNull.Value);
        //}
        //else
        //{
        //    cmd.Parameters.AddWithValue("@USER_ID", userId);
        //}
        cmd.Parameters.AddWithValue("@CATEGORY_ID", categoryId);
        cmd.Parameters.AddWithValue("@COOKING_TIME", cookingTime);
        cmd.Parameters.AddWithValue("@PORTION", portion);
        cmd.Parameters.AddWithValue("@CUISINE_ID", cusineId);
        cmd.Parameters.AddWithValue("@DESCRIPTION", description);
        cmd.Parameters.AddWithValue("@IS_PRIVATE", isPrivate);
        cmd.Parameters.AddWithValue("@RECIPE_PHOTO_NAME", DBNull.Value);

        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
        finally
        {
            con.Close();
        }*/

        string msg = "";
        if (recipeId == 0)
        {
            msg = "Recipe created";
        }
        else
        {
            msg = "Recipe updated";
        }


        return msg;
    }


    public DataTable GetRecipes(int recipeID, String recipeName, int categoryId, int cuisineId, int privateRecipe, int publicRecipe)
    {
       /* string query = @"select R.RECIPE_ID,R.RECIPE_NAME,CG.CATEGORY_ID,CG.CATEGORY_NAME,CS.CUISINE_ID, CS.CUISINE_NAME,R.COOKING_TIME,R.PORTION, R.DESCRIPTION,R.IS_PRIVATE from AOD_RECIPE R, AOD_CATEGORY CG, AOD_CUISINE CS
                        where R.CATEGORY_ID=CG.CATEGORY_ID and R.CUISINE_ID=CS.CUISINE_ID";

        if (recipeID != 0)
        {
            query += "    and R.RECIPE_ID=@RECIPE_ID";
        }
        if (!string.IsNullOrEmpty(recipeName))
        {
            query += "  and R.RECIPE_NAME like '%" + recipeName + "%'";
            //query += "  and R.RECIPE_NAME=@RECIPE_NAME";
        }
        if (categoryId != 0)
        {
            query += "   and R.CATEGORY_ID=@CATEGORY_ID";
        }
        if (cuisineId != 0)
        {
            query += "    and R.CUISINE_ID=@CUISINE_ID";
        }

        if (privateRecipe == 1)
        {
            query += "    and R.IS_PRIVATE=1";
        }
        else if ((publicRecipe == 1))
        {
            query += "    and R.IS_PRIVATE!=1";
        }
        con = new SqlConnection(connectionString);
        cmd = new SqlCommand(query, con);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.Clear();

        if (recipeID != 0)
        {
            cmd.Parameters.AddWithValue("@RECIPE_ID", recipeID);
        }
        if (!string.IsNullOrEmpty(recipeName))
        {
            cmd.Parameters.AddWithValue("@RECIPE_NAME", recipeName);
        }
        if (categoryId != 0)
        {
            cmd.Parameters.AddWithValue("@CATEGORY_ID", categoryId);
        }
        if (cuisineId != 0)
        {
            cmd.Parameters.AddWithValue("@CUISINE_ID", cuisineId);
        }

        cmd.Connection.Open();

        reader = cmd.ExecuteReader();
        DataTable dataTable = new DataTable();
        dataTable.Load(reader);

        cmd.Connection.Close();
        cmd.Connection.Dispose();*/

        return dataTable;
    }


}