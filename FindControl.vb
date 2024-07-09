Private Function FindControlRecursive(Of T As Control)(ByVal root As Control) As T
            If root Is Nothing Then
                Return Nothing
            End If

            For Each control As Control In root.Controls
                If TypeOf control Is T Then
                    Return CType(control, T)
                End If

                Dim foundControl As T = FindControlRecursive(Of T)(control)
                If foundControl IsNot Nothing Then
                    Return foundControl
                End If
            Next

            Return Nothing
        End Function
