<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCLabelText.ascx.cs" Inherits="Assignment1.LabelTextUC" %>
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
  public string TextBoxClass
  {
      set
      {
          ucTextBox.CssClass = value;
      }
  }
  public int TextBoxMaxLength
  {
      set
      {
          ucTextBox.MaxLength = value;
      }
  }
  public string Text
  {
    get
    {
        return ucTextBox.Text;
    }
  }
    public string TextBoxText
  {
    set
    {
        ucTextBox.Text = value;
    }
  }

       public string TextBoxEnable
  {
    set
    {
        ucTextBox.Enabled = bool.Parse(value);
    }
  }
 
</script>
<p>
  <asp:Label ID="ucLabel" runat="server" Text="" Width="120px"/>
  <asp:TextBox ID="ucTextBox" runat="server" Text="" Width="200px" MaxLength="40" />
</p>
