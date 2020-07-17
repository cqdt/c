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


public partial class Modules_Controls_Search_dk : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnTimkiem_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Default.aspx?ctl=Tra-cuu-diem-kiem-tra-tieng-han&search=" + Server.UrlEncode(txtSearch.Text.Trim()) + "&sbd=" + Server.UrlEncode(txtSBD.Text.Trim()) + "");
    }  
}
