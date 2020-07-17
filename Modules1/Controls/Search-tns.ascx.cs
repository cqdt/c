using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Modules_Controls_Search_tns : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnTimkiem_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Default.aspx?ctl=Tu-nghiep-sinhs&nn=" + Server.UrlEncode(txtnghenghiep.Text.Trim()) + "&bc=" + Server.UrlEncode(txtbangcap.Text.Trim()) + "&kn=" + Server.UrlEncode(txtkinhnghiem.Text.Trim()) + "&gt=" + ddlGioitinh.SelectedValue +"");
    }
}
