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

public partial class Admin_Modules_Home : System.Web.UI.UserControl
{
    public string UserName = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        UserName = CMS.MsSql.ExecuteToString("SELECT C_LOGIN_NAME FROM T_USER WHERE PK_USER=" + CMS.TTV.Rule.UserID);
    }
}
