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

public partial class Modules_Tuyen_dung : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strtd = CMS.TTV.Web.Utils.GetStringFromQueryString("td", "").Replace("'", "''");
        string strnn = CMS.TTV.Web.Utils.GetStringFromQueryString("nn", "").Replace("'", "''");
        string strdd = CMS.TTV.Web.Utils.GetStringFromQueryString("dd", "").Replace("'", "''");

        Tuyendungs1.Hoso = strtd;
        Tuyendungs1.Diadiem = strdd;
        Tuyendungs1.Nganhnghe = strnn;
    }
}
