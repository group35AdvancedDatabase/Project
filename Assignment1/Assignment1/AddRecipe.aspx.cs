using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace Assignment1
{
    public partial class AddRecipe : System.Web.UI.Page
    {
        RecipeDataAccessClass dal = new RecipeDataAccessClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategory();
                BindCuisine();
                string editRecipeId = Request["RecipeId"];

                if (!string.IsNullOrEmpty(editRecipeId))
                {
                    hdnRecipeID.Value = editRecipeId;
                    bindRecipeForEdit(Convert.ToInt32(editRecipeId));
                }

                //string msg = dal.CreateOrUpdateRecipe(0, "Test", 0, 2, "1 hour", "5", 2, "Test", 0, null);
            }
        }

        private void BindCategory()
        {
            DataTable dataTable = dal.GetCategoryList();
            DataRow row = dataTable.NewRow();
            row[0] = "0";
            row[1] = "Select";
            dataTable.Rows.Add(row);

            DataRow row1 = dataTable.NewRow();
            row1[0] = "-1";
            row1[1] = "Other";
            dataTable.Rows.Add(row1);

            ddlCategory.DataSource = dataTable;
            ddlCategory.DataTextField = dataTable.Columns["CATEGORY_NAME"].ToString();
            ddlCategory.DataValueField = dataTable.Columns["CATEGORY_ID"].ToString();
            ddlCategory.SelectedValue = "0";
            ddlCategory.DataBind();
        }
        private void BindCuisine()
        {
            DataTable dataTable = dal.GetCuisineList();
            DataRow row = dataTable.NewRow();
            row[0] = "0";
            row[1] = "Select";
            dataTable.Rows.Add(row);

            DataRow row1 = dataTable.NewRow();
            row1[0] = "-1";
            row1[1] = "Other";
            dataTable.Rows.Add(row1);

            ddlCuisine.DataSource = dataTable;
            ddlCuisine.DataTextField = dataTable.Columns["CUISINE_NAME"].ToString();
            ddlCuisine.DataValueField = dataTable.Columns["CUISINE_ID"].ToString();
            ddlCuisine.SelectedValue = "0";
            ddlCuisine.DataBind();

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int recipeId = 0;
                string recipeName = "";
                int categoryId = 0;
                string cookingTime;
                string portion;
                int cusineId = 0;
                string description;
                int isPrivate = 0;
                try
                {
                    if (!string.IsNullOrEmpty(hdnRecipeID.Value))
                    {
                        recipeId = int.Parse(hdnRecipeID.Value);
                    }

                    recipeName = ucRecipeName.Text;
                    categoryId = int.Parse(ddlCategory.SelectedValue);
                    cookingTime = ucCookingTime.Text;
                    portion = ucPortion.Text;
                    cusineId = int.Parse(ddlCuisine.SelectedValue);
                    if (cusineId == -1)
                    {
                        cusineId = 0;
                        reqOtherCuisine.Enabled = true;
                    }
                    description = txtRecipeDescription.Text;

                    if (chkPrivate.Checked)
                    {
                        isPrivate = 1;
                    }

                    string msg = dal.CreateOrUpdateRecipe(recipeId, recipeName, categoryId, cookingTime, portion, cusineId, description, isPrivate);

                    Response.Redirect("Recipes.aspx?MessageToShow=" + msg);
                }
                catch (Exception ex)
                {
                    //show exception message
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "RecipeAddOrUpdate", "alert('" + ex.Message + "')", true);
                }
            }
        }

        private void bindRecipeForEdit(int editRecipeId)
        {
            try
            {

                DataTable dataTable = dal.GetRecipes(editRecipeId, null, 0, 0, 0, 0);

                if (dataTable.Rows.Count == 1)
                {
                    hdnRecipeID.Value = dataTable.Rows[0]["RECIPE_ID"].ToString();
                    ucRecipeName.TextBoxText = dataTable.Rows[0]["RECIPE_Name"].ToString();
                    ddlCategory.SelectedValue = dataTable.Rows[0]["CATEGORY_ID"].ToString();
                    ucCookingTime.TextBoxText = dataTable.Rows[0]["COOKING_TIME"].ToString();
                    ucPortion.TextBoxText = dataTable.Rows[0]["PORTION"].ToString();
                    ddlCuisine.SelectedValue = dataTable.Rows[0]["CUISINE_ID"].ToString();
                    txtRecipeDescription.Text = dataTable.Rows[0]["DESCRIPTION"].ToString();

                    if (dataTable.Rows[0]["IS_PRIVATE"] == DBNull.Value || dataTable.Rows[0]["IS_PRIVATE"].ToString() == "0")
                    {
                        chkPrivate.Checked = false;
                    }
                    else
                    {
                        chkPrivate.Checked = true;
                    }

                    btnSave.Text = "Update Recipe";
                }
                else
                {
                    //No data exist error
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "RecipeAddOrUpdate", "alert('No Data Found')", true);
                }
            }
            catch (Exception ex)
            {
                //Show exception messge
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "RecipeAddOrUpdate", "alert('" + ex.Message + "')", true);
            }
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            int categoryId = int.Parse(ddlCategory.SelectedValue);

            if (categoryId == -1)
            {
                txtOtherCategory.Enabled = true;
                reqOtherCategory.Enabled = true;
            }
            else
            {
                txtOtherCategory.Enabled = false;
                reqOtherCategory.Enabled = false;
            }
        }

        protected void ddlCuisine_SelectedIndexChanged(object sender, EventArgs e)
        {
            int cusineId = int.Parse(ddlCuisine.SelectedValue);

            if (cusineId == -1)
            {
                txtOtherCuisine.Enabled = true;
                reqOtherCuisine.Enabled = true;
            }
            else
            {
                txtOtherCuisine.Enabled = false;
                reqOtherCuisine.Enabled = false;
            }
        }

        protected void ddlIngredients_SelectedIndexChanged(object sender, EventArgs e)
        {
            int ingredientId = int.Parse(ddlIngredients.SelectedValue);

            if (ingredientId == -1)
            {
                txtOtherIngredient.Enabled = true;
                reqOtherIngredient.Enabled = true;
                txtOtherQTY.Enabled = true;
                reqOtherQTY.Enabled = true;
            }
            else
            {
                txtOtherIngredient.Enabled = false;
                reqOtherIngredient.Enabled = false;
                txtOtherQTY.Enabled = false;
                reqOtherQTY.Enabled = false;
            }
        }

        protected void btnAddIngredient_Click(object sender, EventArgs e)
        {
        }

        protected void gvIngredients_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
    }
}