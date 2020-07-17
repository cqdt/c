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


public partial class Modules_Consulting : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Page.Title = "Trung Tam Lao Dong Ngoai Nuoc";
        string strSearch = CMS.TTV.Web.Utils.GetStringFromQueryString("search", "").Replace("'", "''");
        int strLv = CMS.TTV.Web.Utils.GetIntFromQueryString("lv", 0);
        FAQ1.Search = strSearch;
        FAQ1.LV = strLv;
    }
}
