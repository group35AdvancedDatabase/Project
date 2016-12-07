
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment1
{
    public partial class SearchRecipe : System.Web.UI.Page
    {
        RecipeDataAccessClass dal = new RecipeDataAccessClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategory();
                BindCuisine();
            }
        }

        private void BindCategory()
        {
            DataTable dataTable = dal.GetCategoryList();
            DataRow row = dataTable.NewRow();
            row[0] = "0";
            row[1] = "Select";

            dataTable.Rows.Add(row);

            ucCategory.DropDownSetDataSource = dataTable;
            ucCategory.DropDownSetDataTextField = dataTable.Columns["CATEGORY_NAME"].ToString();
            ucCategory.DropDownSetDataValueField = dataTable.Columns["CATEGORY_ID"].ToString();
            ucCategory.DropDownSetSelectedValue = "0";
            ucCategory.DataBind();
        }
        private void BindCuisine()
        {
            DataTable dataTable = dal.GetCuisineList();
            DataRow row = dataTable.NewRow();
            row[0] = "0";
            row[1] = "Select";

            dataTable.Rows.Add(row);
            ucCuisine.DropDownSetDataSource = dataTable;
            ucCuisine.DropDownSetDataTextField = dataTable.Columns["CUISINE_NAME"].ToString();
            ucCuisine.DropDownSetDataValueField = dataTable.Columns["CUISINE_ID"].ToString();
            ucCuisine.DropDownSetSelectedValue = "0";
            ucCuisine.DataBind();
        }
        protected void gvRecipes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvRecipes.PageIndex = e.NewPageIndex;
            BindGrid();
        }



        protected void gvRecipes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Response.Redirect("AddRecipe.aspx?RecipeId=" +  (int)gvRecipes.DataKeys[e.NewEditIndex].Value);
        }




        protected void BindGrid()
        {
            String recipeName = ucSaerchName.Text;
            int categoryId = int.Parse(ucCategory.DropDownSelectedValue);
            int cuisineId = int.Parse(ucCuisine.DropDownSelectedValue);
            int privateRecipe = 0;
            int publicRecipe = 0;
            if (rbtnPrivate.Checked)
            {
                privateRecipe = 1;
            }

            if (rbtnPublic.Checked)
            {
                publicRecipe = 1;
            }

            DataTable dataTable = dal.GetRecipes(0, recipeName, categoryId, cuisineId, privateRecipe, publicRecipe);
            gvRecipes.DataSource = dataTable;

            //Store the RECIPE_ID as a DataKey
            gvRecipes.DataKeyNames = new string[] { dataTable.Columns["RECIPE_ID"].ToString() };
            gvRecipes.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void btnResetSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("SearchRecipe.aspx");
        }
        
    }
}