Public Class SiteMaster
    Inherits MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Dim path As String = Request.Url.AbsolutePath.ToLower()
        If path.Contains("/aboutus") Then lnkAboutUs.Attributes("class") = "nav-link active"
        If path.Contains("/products") Then lnkProducts.Attributes("class") = "nav-link active"
        If path.Contains("/service") Then lnkService.Attributes("class") = "nav-link active"
        If path.Contains("/production") Then lnkProduction.Attributes("class") = "nav-link active"
        If path.Contains("/pages/operations") Then lnkOperations.Attributes("class") = "nav-link dropdown-toggle active"
    End Sub

End Class