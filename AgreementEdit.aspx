<%@ Page Title="Agreement Onboarding Details Edit" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="AgreementEdit.aspx.vb" Inherits="FDIC.AgreementEdit" %>

<%@ Register TagPrefix="cc1" Namespace="FDIC" Assembly="FDIC" %>
<%@ Register TagPrefix="cc2" TagName="FilterResetControl" Src="~/Common/Controls/FilterResetControl.ascx" %>
<%@ Register TagPrefix="cc" TagName="OnlineHelp" Src="~/Common/Controls/OnlineHelpControl.ascx" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="left">Agreement Onboarding Details Edit
    </h2>

    <div class="right">
        <cc:OnlineHelp ID="hlpAgreementEdit" runat="server" />
        &nbsp;&nbsp;<asp:HyperLink ID="hypReturnToAgreementList" runat="server" Text="&laquo; Back to Agreement Onboarding Details List" NavigateUrl="~/Pages/Administration/AgreementOnboardingDetails/AgreementList.aspx" OnLoad="hlBack_Load" />&nbsp;&nbsp;
    </div>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="upAgreementEdit">
        <ProgressTemplate>
            <div class="loading">
                <asp:Image ID="imgLoading" runat="server" ImageUrl="~/Images/ajax_loader.gif" AlternateText="Loading, please wait..." />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdatePanel ID="upAgreementEdit" runat="server">
        <ContentTemplate>
            <fieldset>
                <legend>Agreement Details</legend>
                <asp:ValidationSummary ID="AgreementEditValidationSummary" DisplayMode="BulletList" runat="server" CssClass="infoMessage" />
                <div id="divForm">
                    <asp:FormView ID="fvAgreementEdit" runat="server" RenderOuterTable="False" OnDataBound="fvAgreementEdit_DataBound">
                        <ItemTemplate>
                            <asp:HiddenField ID="hdnAgreementId" runat="server" Value='<%#Eval("AgreementID")%>' />
                            <p style="padding-bottom: 17.5px;">
                                <asp:Label ID="Label1" runat="server"
                                    Text="Agreement Version: " CssClass="sideLabel prompt-200w"></asp:Label>
                                <asp:TextBox ID="AgreementVersionTextBox" runat="server" Text='<%#Bind("AgreementVersion") %>'
                                    CssClass="sideLabel" ToolTip="Enter an Agreement Version of 100 characters or less"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="AgreementVersionRegularExpressionValidator" runat="server" Enabled="true"
                                    ControlToValidate="AgreementVersionTextBox" ErrorMessage="The Agreement Version exceeds the maximum 100 characters."
                                    SetFocusOnError="true" Display="Dynamic"
                                    ValidationExpression="^[\s\S]{1,100}$" CssClass="failureNotification">*</asp:RegularExpressionValidator>
                            </p>
                            <p>
                                <asp:Label ID="Label2" runat="server"
                                    Text="SharePctTotBal: " CssClass="sideLabel prompt-200w"></asp:Label>
                                <asp:TextBox ID="SharePctTotalBalTextBox" runat="server" Text='<%#Bind("SharePctTotBal") %>'
                                    CssClass="sideLabel"></asp:TextBox>
                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Double"
                                    ControlToValidate="SharePctTotalBalTextBox" ErrorMessage="Value must be numeric" CssClass="failureNotification">*</asp:CompareValidator>
                            </p>
                            <p>
                                <asp:Label ID="Label3" runat="server"
                                    Text="PctFactorATrueUp: " CssClass="sideLabel prompt-200w"></asp:Label>
                                <asp:TextBox ID="PctFactorATrueUpTextBox" runat="server" Text='<%#Bind("PctFactorATrueUp") %>'
                                    CssClass="sideLabel"></asp:TextBox>
                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Double"
                                    ControlToValidate="PctFactorATrueUpTextBox" ErrorMessage="Value must be numeric" CssClass="failureNotification">*</asp:CompareValidator>
                            </p>
                            <p>
                                <asp:Label ID="Label4" runat="server"
                                    Text="AssLSRatio: " CssClass="sideLabel prompt-200w"></asp:Label>
                                <asp:TextBox ID="AssLSRatioTextBox" runat="server" Text='<%#Bind("AssLSRatio") %>'
                                    CssClass="sideLabel"></asp:TextBox>
                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Double"
                                    ControlToValidate="AssLSRatioTextBox" ErrorMessage="Value must be numeric" CssClass="failureNotification">*</asp:CompareValidator>
                            </p>
                            <p>
                                <asp:Label ID="Label5" runat="server"
                                    Text="AssToAcq: " CssClass="sideLabel prompt-200w"></asp:Label>
                                <asp:TextBox ID="AssToAcqTextBox" runat="server" Text='<%#Bind("AssToAcq") %>'
                                    CssClass="sideLabel"></asp:TextBox>
                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Double"
                                    ControlToValidate="AssToAcqTextBox" ErrorMessage="Value must be numeric" CssClass="failureNotification">*</asp:CompareValidator>
                            </p>
                            <p style="padding-bottom: 17.5px;">
                                <asp:Label ID="Label6" runat="server"
                                    Text="TrueUpVersion: " CssClass="sideLabel prompt-200w"></asp:Label>
                                <asp:TextBox ID="TrueUpVersionTextBox" runat="server" Text='<%#Bind("TrueUpVersion") %>' 
                                    CssClass="sideLabel" ToolTip="Enter an True Up Version of 20 characters or less"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Enabled="true"
                                    ControlToValidate="TrueUpVersionTextBox" ErrorMessage="The True Up Version exceeds the maximum 20 characters."
                                    SetFocusOnError="true" Display="Dynamic"
                                    ValidationExpression="^[\s\S]{1,20}$" CssClass="failureNotification">*</asp:RegularExpressionValidator>
                            </p>
                            <p>
                                <asp:Label ID="Label13" runat="server"
                                    Text="TrueUpCap: " CssClass="sideLabel prompt-200w"></asp:Label>
                                <asp:TextBox ID="TrueUpCapTextBox" runat="server" Text='<%# String.Format("{0:N}", Eval("TrueUpCap")) %>' 
                                    CssClass="sideLabel"></asp:TextBox>
                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Currency"
                                    ControlToValidate="TrueUpCapTextBox" ErrorMessage="Value must be numeric" CssClass="failureNotification">*</asp:CompareValidator>
                            </p>
                            <p style="padding-bottom: 17.5px;">
                                <asp:Label ID="Label14" runat="server"
                                    Text="TrueUpTableVersion: " CssClass="sideLabel prompt-200w"></asp:Label>
                                <asp:TextBox ID="TrueUpTableVersionTextBox" runat="server" Text='<%#Bind("TrueUpTableVersion") %>'
                                    CssClass="sideLabel" ToolTip="Enter an True Up Table Version of 20 characters or less"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" Enabled="true"
                                    ControlToValidate="TrueUpTableVersionTextBox" ErrorMessage="The True Up Table Version exceeds the maximum 20 characters."
                                    SetFocusOnError="true" Display="Dynamic"
                                    ValidationExpression="^[\s\S]{1,20}$" CssClass="failureNotification">*</asp:RegularExpressionValidator>
                            </p>
                            <p>
                                <asp:Label ID="Label7" runat="server"
                                    Text="InstrinsicLossEstAll: " CssClass="sideLabel prompt-200w"></asp:Label>
                                <asp:TextBox ID="IntrinsicLossEstAllTextBox" runat="server" Text='<%#Bind("IntrinsicLossEstAll") %>'
                                    CssClass="sideLabel"></asp:TextBox>
                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Double"
                                    ControlToValidate="IntrinsicLossEstAllTextBox" ErrorMessage="Value must be numeric" CssClass="failureNotification">*</asp:CompareValidator>
                            </p>
                            <p>
                                <asp:Label ID="Label8" runat="server"
                                    Text="FinalNSFSharedLossQTR: " CssClass="sideLabel prompt-200w"></asp:Label>
                                <asp:TextBox ID="FinalNSFSharedLossQTRTextBox" runat="server" Text='<%#Eval("FinalNSFSharedLossQTR", "{0:yyyy-MM-dd}") %>' TextMode="Date"
                                    CssClass="sideLabel"></asp:TextBox>
                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Date"
                                    ControlToValidate="FinalNSFSharedLossQTRTextBox" ErrorMessage="Value must be a date" CssClass="failureNotification">*</asp:CompareValidator>
                            </p>
                            <p>
                                <asp:Label ID="Label9" runat="server"
                                    Text="FinalRecovQTRCalcType: " CssClass="sideLabel prompt-200w"></asp:Label>
                                <asp:DropDownList ID="FinalRecovQTRCalcTypeTypeDropDown" runat="server">
                                </asp:DropDownList>
                            </p>
                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </fieldset>

            <fieldset>
                <legend>Resolution Transaction</legend>
                <asp:ValidationSummary ID="ValidationSummary1" DisplayMode="BulletList" runat="server" CssClass="infoMessage" />
                <div id="divForm2">
                    <asp:FormView ID="fvResolutionTransactionEdit" runat="server" RenderOuterTable="False"
                        OnDataBound="fvResolutionTransactionEdit_DataBound">
                        <ItemTemplate>
                            <p>
                                <asp:Label ID="Label12" runat="server"
                                    Text="Transaction Type: " CssClass="sideLabel prompt-200w"></asp:Label>
                                <asp:DropDownList ID="TransactionTypeDropDown"
                                    AutoPostBack="True"
                                    OnSelectedIndexChanged="TransactionTypeDropDown_SelectedIndexChanged"
                                    runat="server" />
                            </p>
                            <p>
                                <asp:Label ID="Label8" runat="server"
                                    Text="ResolutionContractEndDate: " CssClass="sideLabel prompt-200w"></asp:Label>
                                <asp:TextBox ID="ResolutionContractEndDateTextBox" runat="server" Text='<%#Eval("ResolutionContractEndDate", "{0:yyyy-MM-dd}") %>' TextMode="Date"
                                    CssClass="sideLabel"></asp:TextBox>
                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Date"
                                    ControlToValidate="ResolutionContractEndDateTextBox" ErrorMessage="Value must be a date" CssClass="failureNotification">*</asp:CompareValidator>
                            </p>
                            <p>
                                <asp:Label ID="Label10" runat="server"
                                    Text="RecoveryPeriod: " CssClass="sideLabel prompt-200w"></asp:Label>
                                <asp:TextBox ID="RecoveryPeriodTextBox" runat="server" Text='<%#Eval("RecoveryPeriod", "{0:yyyy-MM-dd}") %>' TextMode="Date"
                                    CssClass="sideLabel"></asp:TextBox>
                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Date"
                                    ControlToValidate="RecoveryPeriodTextBox" ErrorMessage="Value must be a date" CssClass="failureNotification">*</asp:CompareValidator>
                            </p>
                            <p>
                                <asp:Label ID="Label11" runat="server"
                                    Text="FinalCertificatePeriodEndDate: " CssClass="sideLabel prompt-200w"></asp:Label>
                                <asp:TextBox ID="FinalCertificatePeriodEndDateTextBox" runat="server" Text='<%#Eval("FinalCertificatePeriodEndDate", "{0:yyyy-MM-dd}") %>' TextMode="Date"
                                    CssClass="sideLabel"></asp:TextBox>
                                <asp:CompareValidator runat="server" Operator="DataTypeCheck" Type="Date"
                                    ControlToValidate="FinalCertificatePeriodEndDateTextBox" ErrorMessage="Value must be a date" CssClass="failureNotification">*</asp:CompareValidator>
                            </p>
                            <p>
                                <asp:Label ID="llEarlyTermination" runat="server"
                                    Text="Early Termination " CssClass="sideLabel prompt-200w"></asp:Label>
                                <label for="RadioButtonYes">
                                    <asp:RadioButton ID="RadioButtonYes" runat="server" GroupName="editOption" Text="Yes" OnClick="toggleField(this)" />
                                </label>
                                <label for="RadioButtonNo">
                                    <asp:RadioButton ID="RadioButtonNo" runat="server" GroupName="editOption" Text="No" Checked="True" />
                                </label>

                                <script type="text/javascript">
                                    function toggleField(this) {
                                        var yesRadio = document.getElementById('<%= RadioButtonYes.AgreementID %>');
            var dataField = document.getElementById('<%= FinalCertificatePeriodEndDateTextBox.AgreementID %>');
                                        if (yesRadio.checked) {
                                            dataField.disabled = false;
                                        } else {
                                            dataField.disabled = true;
                                        }
                                    }
                                </script>

                            </p>


                        </ItemTemplate>
                    </asp:FormView>
                </div>
            </fieldset>
            <asp:LinkButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"
                ToolTip="Save" CssClass="styledLink primary" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

