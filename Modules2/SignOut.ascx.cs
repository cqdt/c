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

public partial class Modules_SignOut : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int iCusID = CMS.Utils.ToInteger(CMS.TTV.Cookies.Get("PK_TT"));
        CMS.TTV.Cookies.Remove("PK_TT");     
       // CMS.MsSql.ExecuteNonQuery("update T_CUSTOMER SET C_ONLINE=0 WHERE PK_CUSTOMER='" + iCusID + "'");
        Response.Redirect(Request.UrlReferrer.AbsoluteUri);
    }
}
