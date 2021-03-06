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

public partial class Modules_Search : System.Web.UI.UserControl
{
    public string strSearch = "";  
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Page.Title = Newwind.Setting.Title + " -> " + CMS.Lang.GetKey("Search.ascx", "Search");
        strSearch = CMS.TTV.Web.Utils.GetStringFromQueryString("searchtt", "");
        int menuID = CMS.Utils.ToInteger(Request.QueryString["mnuID"]); ;//CMS.TTV.Web.Utils.GetIntFromQueryString("mnuID",231);
        if (menuID > 0) Articles1.MenuID = menuID;
        Articles1.Search = strSearch;
    }
}
