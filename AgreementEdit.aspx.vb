Imports System.Data.Entity.Infrastructure
Imports System.IO
Imports FDIC.Common

Partial Public Class AgreementEdit
    Inherits BasePage


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' Add the OnClick event handlers dynamically
        AddHandler RadioButtonYes.CheckedChanged, AddressOf RadioButtonYes_CheckedChanged
        AddHandler RadioButtonNo.CheckedChanged, AddressOf RadioButtonNo_CheckedChanged
    End Sub

    Private Sub AgreementEdit_PreRender(sender As Object, e As System.EventArgs) Handles Me.PreRender
        If Not Page.IsPostBack Then
            If Session("AgreementGuid") Is Nothing Then
                Return
            End If
            Dim sessionId As Integer = CInt(Session("AgreementGuid"))
            Using ctx As New RTAggregationEntities
                fvAgreementEdit.DataSource = ctx.LSAgreementDetails.Where(Function(i) i.AgreementID = sessionId).ToList()
                fvResolutionTransactionEdit.DataSource = ctx.ResolutionTransactions.Where(Function(i) i.AgreementID = sessionId).OrderBy(Function(i) i.ResolutionTransactionID).ToList()
            End Using
            fvAgreementEdit.DataBind()
            fvResolutionTransactionEdit.DataBind()
        End If
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        Dim eds As HiddenField = TryCast(fvAgreementEdit.FindControl("hdnAgreementId"), HiddenField)
        Dim rbl As TextBox = TryCast(fvAgreementEdit.FindControl("AgreementVersionTextBox"), TextBox)
        Dim sharePctTotBal As TextBox = TryCast(fvAgreementEdit.FindControl("SharePctTotalBalTextBox"), TextBox)
        Dim pctFactorATrueUp As TextBox = TryCast(fvAgreementEdit.FindControl("PctFactorATrueUpTextBox"), TextBox)
        Dim assLSRatio As TextBox = TryCast(fvAgreementEdit.FindControl("AssLSRatioTextBox"), TextBox)
        Dim assToAcq As TextBox = TryCast(fvAgreementEdit.FindControl("AssToAcqTextBox"), TextBox)
        Dim trueUpVersion As TextBox = TryCast(fvAgreementEdit.FindControl("TrueUpVersionTextBox"), TextBox)
        Dim trueUpCap As TextBox = TryCast(fvAgreementEdit.FindControl("TrueUpCapTextBox"), TextBox)
        Dim trueUpTableVersion As TextBox = TryCast(fvAgreementEdit.FindControl("TrueUpTableVersionTextBox"), TextBox)
        Dim intrinsicLossEstAll As TextBox = TryCast(fvAgreementEdit.FindControl("IntrinsicLossEstAllTextBox"), TextBox)
        Dim finalNSFSharedLossQTR As TextBox = TryCast(fvAgreementEdit.FindControl("FinalNSFSharedLossQTRTextBox"), TextBox)
        Dim finalRecovQTRCalcType As DropDownList = TryCast(fvAgreementEdit.FindControl("FinalRecovQTRCalcTypeTypeDropDown"), DropDownList)

        Dim resolutionContractEndDate As TextBox = TryCast(fvResolutionTransactionEdit.FindControl("ResolutionContractEndDateTextBox"), TextBox)
        Dim recoveryPeriod As TextBox = TryCast(fvResolutionTransactionEdit.FindControl("RecoveryPeriodTextBox"), TextBox)
        Dim finalCertificatePeriodEndDate As TextBox = TryCast(fvResolutionTransactionEdit.FindControl("FinalCertificatePeriodEndDateTextBox"), TextBox)
        Dim transactionType As DropDownList = TryCast(fvResolutionTransactionEdit.FindControl("TransactionTypeDropDown"), DropDownList)

        Dim sessionId As Integer = CInt(eds.Value)
        Using ctx As New RTAggregationEntities
            Dim adRecord As LSAgreementDetail = ctx.LSAgreementDetails.Where(Function(i) i.AgreementID = sessionId).FirstOrDefault()
            Dim rsRecord As ResolutionTransaction = ctx.ResolutionTransactions.Where(Function(i) i.AgreementID = sessionId And i.TransType.Equals(transactionType.Text)).FirstOrDefault()
            If adRecord IsNot Nothing And rsRecord IsNot Nothing Then
                adRecord.AgreementVersion = If(String.IsNullOrEmpty(rbl.Text), Nothing, rbl.Text)
                adRecord.SharePctTotBal = If(String.IsNullOrEmpty(sharePctTotBal.Text), Nothing, CType(sharePctTotBal.Text, Decimal))
                adRecord.PctFactorATrueUp = If(String.IsNullOrEmpty(pctFactorATrueUp.Text), Nothing, CType(pctFactorATrueUp.Text, Double))
                adRecord.AssLSRatio = If(String.IsNullOrEmpty(assLSRatio.Text), Nothing, CType(assLSRatio.Text, Double))
                adRecord.AssToAcq = If(String.IsNullOrEmpty(assToAcq.Text), Nothing, CType(assToAcq.Text, Decimal))
                adRecord.TrueUpVersion = If(String.IsNullOrEmpty(trueUpVersion.Text), Nothing, trueUpVersion.Text)
                adRecord.TrueUpCap = If(String.IsNullOrEmpty(trueUpCap.Text), Nothing, CType(trueUpCap.Text, Decimal))
                adRecord.TrueUpTableVersion = If(String.IsNullOrEmpty(trueUpTableVersion.Text), Nothing, trueUpTableVersion.Text)
                adRecord.IntrinsicLossEstAll = If(String.IsNullOrEmpty(intrinsicLossEstAll.Text), Nothing, CType(intrinsicLossEstAll.Text, Decimal))
                adRecord.FinalNSFSharedLossQTR = If(String.IsNullOrEmpty(finalNSFSharedLossQTR.Text), CType(Nothing, Date?), CType(finalNSFSharedLossQTR.Text, Date))
                adRecord.FinalRecovQtrCalcType = Integer.Parse(finalRecovQTRCalcType.Text)

                rsRecord.ResolutionContractEndDate = If(String.IsNullOrEmpty(resolutionContractEndDate.Text), CType(Nothing, Date?), CType(resolutionContractEndDate.Text, Date))
                rsRecord.RecoveryPeriod = If(String.IsNullOrEmpty(recoveryPeriod.Text), CType(Nothing, Date?), CType(recoveryPeriod.Text, Date))
                rsRecord.FinalCertificatePeriodEndDate = If(String.IsNullOrEmpty(finalCertificatePeriodEndDate.Text), CType(Nothing, Date?), CType(finalCertificatePeriodEndDate.Text, Date))
                ctx.SaveChanges()
            End If
        End Using
        Response.Redirect(Request.RawUrl)
    End Sub

    Protected Sub fvResolutionTransactionEdit_DataBound(sender As Object, e As EventArgs)
        Dim ddl As DropDownList = Nothing
        If (fvResolutionTransactionEdit.Row IsNot Nothing) Then
            ddl = TryCast(fvResolutionTransactionEdit.FindControl("TransactionTypeDropDown"), DropDownList)
            ddl.SelectedIndex = fvResolutionTransactionEdit.PageIndex
            Dim sessionId As Integer = CInt(Session("AgreementGuid"))
            Using ctx As New RTAggregationEntities
                ddl.DataSource = ctx.ResolutionTransactions.Where(Function(i) i.AgreementID = sessionId).OrderBy(Function(i) i.ResolutionTransactionID).Select(Function(i) i.TransType).ToList()
            End Using
            ddl.DataBind()
        End If
    End Sub

    Protected Sub TransactionTypeDropDown_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim sessionId As Integer = CInt(Session("AgreementGuid"))
        Using ctx As New RTAggregationEntities
            Dim dataSrc As List(Of ResolutionTransaction) = ctx.ResolutionTransactions.Where(Function(i) i.AgreementID = sessionId).OrderBy(Function(i) i.ResolutionTransactionID).ToList()
            Dim ddl As DropDownList = TryCast(fvResolutionTransactionEdit.FindControl("TransactionTypeDropDown"), DropDownList)
            Dim index As Integer = dataSrc.FindIndex(Function(i) i.TransType.Equals(ddl.Text))
            Dim transType As ResolutionTransaction = dataSrc(index)
            fvResolutionTransactionEdit.PageIndex = index
            fvResolutionTransactionEdit.DataSource = dataSrc
        End Using
        fvResolutionTransactionEdit.DataBind()
    End Sub

    Protected Sub fvAgreementEdit_DataBound(sender As Object, e As EventArgs)
        Dim ddl As DropDownList = Nothing
        If (fvAgreementEdit.Row IsNot Nothing) Then
            ddl = TryCast(fvAgreementEdit.FindControl("FinalRecovQTRCalcTypeTypeDropDown"), DropDownList)
            Dim sessionId As Integer = CInt(Session("AgreementGuid"))
            Using ctx As New RTAggregationEntities
                Dim calculationType As String = ctx.LSAgreementDetails.Where(Function(i) i.AgreementID = sessionId).Select(Function(i) i.FinalRecovQtrCalcType).FirstOrDefault().ToString()
                Dim dataSrc As List(Of String) = New List(Of String) From {"0", "1", "2", "3", "4"}
                Dim index As Integer = dataSrc.FindIndex(Function(i) i.Equals(calculationType))
                ddl.DataSource = dataSrc
                ddl.SelectedIndex = index
            End Using
            ddl.DataBind()
        End If
    End Sub

    Protected Sub RadioButtonYes_Click(sender As Object, e As EventArgs) Handles RadioButtonYes.Click
        FinalCertificatePeriodEndDateTextBox.Enabled = True
    End Sub

    Protected Sub RadioButtonNo_Click(sender As Object, e As EventArgs) Handles RadioButtonNo.Click
        FinalCertificatePeriodEndDateTextBox.Enabled = False
    End Sub
End Class
