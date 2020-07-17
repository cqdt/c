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

public partial class Modules_Tim_kiem : System.Web.UI.UserControl
{
    private string _Type = "";
    public string Type
    {
        set { _Type = value; }
        get { return _Type; }
    }
    public string strSearch = "";
    protected void Page_Load(object sender, EventArgs e)
    {        
        strSearch = CMS.TTV.Web.Utils.GetStringFromQueryString("search", "").Replace("'", "''");
        Articles1.Search = strSearch; 
    }
}
