using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace Assignment1
{
    public partial class Recipies : System.Web.UI.Page
    {
        RecipeDataAccessClass dal = new RecipeDataAccessClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["MessageToShow"] != null && !string.IsNullOrEmpty(Request["MessageToShow"]))
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "RecipeAddOrUpdate", "alert('" + Request["MessageToShow"] + "')", true);
                }

                BindGrid();
            }
        }
        protected void gvRecipes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvRecipes.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void BindGrid()
        {
            DataTable dataTable = dal.GetRecipes(0, null, 0, 0, 0, 0);
            gvRecipes.DataSource = dataTable;

            //Store the RECIPE_ID as a DataKey
            gvRecipes.DataKeyNames = new string[] { dataTable.Columns["RECIPE_ID"].ToString() };
            gvRecipes.DataBind();
        }
        protected void gvRecipes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Response.Redirect("AddRecipe.aspx?RecipeId=" + (int)gvRecipes.DataKeys[e.NewEditIndex].Value);
        }

    }
}