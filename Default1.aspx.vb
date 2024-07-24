Partial Class Default
    Inherits System.Web.UI.Page

    Protected Sub RadioButtonYes_Click(sender As Object, e As EventArgs) Handles RadioButtonYes.Click
        dataField.Enabled = True
    End Sub

    Protected Sub RadioButtonNo_Click(sender As Object, e As EventArgs) Handles RadioButtonNo.Click
        dataField.Enabled = False
    End Sub
End Class
