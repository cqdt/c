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

public partial class Modules_Base_Online : System.Web.UI.UserControl
{
    //public int CountVisit = 0;
    //public int CountOnline = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        //CountVisit = CMS.MsSql.ExecuteToInt("SELECT [C_VALUE] FROM [T_SETTING] WHERE [C_CODE]='VISIT'");
        //CountOnline = CMS.MsSql.ExecuteScalarToInt("SELECT COUNT(*) FROM T_ONLINE WHERE C_TIME > " + System.DateTime.Now.AddMinutes(-15).Ticks + "");
        //if (CountOnline == 0) CountOnline = 1;
    }
}
