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

public partial class Modules_Controls_Search : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string strSearch = CMS.TTV.Web.Utils.GetStringFromQueryString("searchtt", "").Replace("'", "''");
        //if (strSearch != "") txtSearch.Text = strSearch;

         
    }

    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        string url = Newwind.VQS.URL;
        Response.Redirect(url + "/tim-kiem.aspx?&search=" + Server.UrlEncode(txtSearch.Text.Trim()));           
    }
    
}