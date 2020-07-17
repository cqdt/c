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

public partial class Modules_Controls_Search_td : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnTimkiem_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Default.aspx?ctl=Tuyen-dung&td=" + Server.UrlEncode(txttieude.Text.Trim()) + "&nn=" + Server.UrlEncode(txtnganhnghe.Text.Trim()) + "&dd=" + Server.UrlEncode(txtdiadiem.Text.Trim()) + "");
    }
}
