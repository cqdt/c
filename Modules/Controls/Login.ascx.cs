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

public partial class Modules_Controls_Login : System.Web.UI.UserControl
{
  //  public string LName;
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
   
    protected void btnLogin_Click(object sender, ImageClickEventArgs e)
    {
        string strUser = "";
        string strPass = "";
        strUser = txtUser.Text.Trim();
        strPass = txtPass.Text;
        strUser = strUser.Replace("'", "''").Replace(";", "").Replace("\"", "").Replace("--", "");
        int tID = GetID(strUser, strPass);
        if (tID > 0)
        {
            CMS.TTV.Cookies.Set("PK_TT", tID + "");
            
        }
    }
    public int GetID(string LoginName, string Password)
    {
        return CMS.MsSql.ExecuteToInt("SELECT PK_TT FROM T_TT WHERE C_MA=N'" + LoginName + "' AND C_PASS='" + Password + "'");
    }
}
