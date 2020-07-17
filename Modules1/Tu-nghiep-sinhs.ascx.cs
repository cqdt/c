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

public partial class Modules_Tu_nghiep_sinhs : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strnn = CMS.TTV.Web.Utils.GetStringFromQueryString("nn", "").Replace("'", "''");
        string strbc = CMS.TTV.Web.Utils.GetStringFromQueryString("bc", "").Replace("'", "''");
        string strkn = CMS.TTV.Web.Utils.GetStringFromQueryString("kn", "").Replace("'", "''");
        string strgt = CMS.TTV.Web.Utils.GetStringFromQueryString("gt", "").Replace("'", "''");

        Tunghiepsinhs1.Nghenhiep = strnn;
        Tunghiepsinhs1.Bangcap = strbc;
        Tunghiepsinhs1.Kinhnghiem = strkn;
        Tunghiepsinhs1.Gioitinh = strgt;
    }
}
