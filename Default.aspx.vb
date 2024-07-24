<%@ Page Language="vb" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Editable Data Field</title>
    <script type="text/javascript">
        function toggleField(isEditable) {
            document.getElementById('<%= dataField.ClientID %>').disabled = !isEditable;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:RadioButton ID="RadioButtonYes" runat="server" GroupName="editOption" Text="Yes" 
                OnClick="RadioButtonYes_Click" />
            <asp:RadioButton ID="RadioButtonNo" runat="server" GroupName="editOption" Text="No" 
                OnClick="RadioButtonNo_Click" />

            <br /><br />

            <asp:Label ID="Label1" runat="server" Text="Data Field:"></asp:Label>
            <asp:TextBox ID="dataField" runat="server" Enabled="False"></asp:TextBox>
        </div>
    </form>
</body>
</html>
