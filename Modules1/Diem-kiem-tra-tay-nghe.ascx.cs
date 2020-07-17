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

public partial class Modules_Diem_kiem_tra_tay_nghe : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strSearch = CMS.TTV.Web.Utils.GetStringFromQueryString("search", "").Replace("'", "''");
        string strSBD = CMS.TTV.Web.Utils.GetStringFromQueryString("sbd", "").Replace("'", "''");
        List1.Search = strSearch;
        List1.SBD = strSBD;
    }
}
