<%@ Page Language="vb" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Editable Data Field</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label for="RadioButtonYes">
                <asp:RadioButton ID="RadioButtonYes" runat="server" GroupName="editOption" Text="Yes" />
            </label>
            <label for="RadioButtonNo">
                <asp:RadioButton ID="RadioButtonNo" runat="server" GroupName="editOption" Text="No" Checked="True" />
            </label>

            <br /><br />

            <asp:Label ID="Label1" runat="server" Text="Data Field:"></asp:Label>
            <asp:TextBox ID="dataField" runat="server" Enabled="False"></asp:TextBox>
        </div>
    </form>
</body>
</html>
