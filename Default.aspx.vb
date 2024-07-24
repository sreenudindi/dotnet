Partial Class Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' Add the OnClick event handlers dynamically
        AddHandler RadioButtonYes.CheckedChanged, AddressOf RadioButtonYes_CheckedChanged
        AddHandler RadioButtonNo.CheckedChanged, AddressOf RadioButtonNo_CheckedChanged
    End Sub

    Protected Sub RadioButtonYes_CheckedChanged(sender As Object, e As EventArgs)
        dataField.Enabled = RadioButtonYes.Checked
    End Sub

    Protected Sub RadioButtonNo_CheckedChanged(sender As Object, e As EventArgs)
        dataField.Enabled = Not RadioButtonNo.Checked
    End Sub
End Class
