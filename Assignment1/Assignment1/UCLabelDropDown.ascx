<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCLabelDropDown.ascx.cs" Inherits="Assignment1.UCLabelDropDown" %>
<script runat="server">
  public string LabelText
  {
    set
    {
        ucLabel.Text = value;
    }
  }
  public string LabelClass
  {
      set
      {
          ucLabel.CssClass = value;
      }
  }
  public string DropDownClass
  {
      set
      {
          ucDDL.CssClass = value;
      }
  }
  public string DropDownSelectedValue
  {
    get
    {
        return ucDDL.SelectedValue;
    }
  }

  public int DropDownSelectedIndex
  {
      get
      {
          return ucDDL.SelectedIndex;
      }
  }

  public string DropDownSelectedText
  {
      get
      {
          return ucDDL.Text;
      }
  }

  public string DropDownSetSelectedText
  {
      set
      {
          ucDDL.Text = value;
      }
  }
      public string DropDownSetSelectedValue
  {
      set
      {
          ucDDL.SelectedValue = value;
      }
  }
  public object DropDownSetDataSource
  {
      set
      {
          ucDDL.DataSource = value;
      }
  }
  public string DropDownSetDataTextField
  {
      set
      {
          ucDDL.DataTextField = value;
      }
  }
  public string DropDownSetDataValueField
  {
      set
      {
          ucDDL.DataValueField = value;
      }
  }
</script>
<p>
  <asp:Label ID="ucLabel" runat="server" Text="" Width="120px" />
    <asp:DropDownList ID="ucDDL" runat="server"  Width="205px" ></asp:DropDownList>
</p>
