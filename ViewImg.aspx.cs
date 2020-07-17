using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class ViewImg : System.Web.UI.Page
{
    public string img = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["img"] == null) Response.Redirect("Default.aspx");
        else
        {
            img = Request.QueryString["img"];
        }
    }
}
