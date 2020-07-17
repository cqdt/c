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

public partial class Modules_FAQ : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string strSearch = CMS.TTV.Web.Utils.GetStringFromQueryString("search", "").Replace("'", "''");
        int strLv = CMS.TTV.Web.Utils.GetIntFromQueryString("lv", 0);
        FAQ1.Search = strSearch;
        FAQ1.LV = strLv;
    }
}
