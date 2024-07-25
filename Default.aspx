<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Editable Data Field</title>
    <script type="text/javascript">
        function toggleField() {
            var yesRadio = document.getElementById('<%= RadioButtonYes.ClientID %>');
            var dataField = document.getElementById('<%= dataField.ClientID %>');
            if (yesRadio.checked) {
                dataField.disabled = false;
            } else {
                dataField.disabled = true;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label for="RadioButtonYes">
                <asp:RadioButton ID="RadioButtonYes" runat="server" GroupName="editOption" Text="Yes" OnClick="toggleField()" />
            </label>
            <label for="RadioButtonNo">
                <asp:RadioButton ID="RadioButtonNo" runat="server" GroupName="editOption" Text="No" Checked="True" OnClick="toggleField()" />
            </label>

            <br /><br />

            <asp:Label ID="Label1" runat="server" Text="Data Field:"></asp:Label>
            <asp:TextBox ID="dataField" runat="server" Enabled="False"></asp:TextBox>
        </div>
    </form>
</body>
</html>
