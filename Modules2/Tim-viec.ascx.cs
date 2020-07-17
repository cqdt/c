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

public partial class Modules_Tim_viec : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strtd = CMS.TTV.Web.Utils.GetStringFromQueryString("td", "").Replace("'", "''");
        string strnn = CMS.TTV.Web.Utils.GetStringFromQueryString("nn", "").Replace("'", "''");
        string strbc = CMS.TTV.Web.Utils.GetStringFromQueryString("bc", "").Replace("'", "''");

        Timviecs1.Hoso = strtd;
        Timviecs1.Bangcap = strbc;
        Timviecs1.Nganhnghe = strnn;
    }
}
