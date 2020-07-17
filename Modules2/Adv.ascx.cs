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

public partial class Modules_Adv : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {       
        int advID = CMS.Utils.ToInteger(Request.QueryString["advID"]);
        if (advID>0) OpenLink(advID);         
    }

    private void OpenLink(int advID)
    {
        string sql = "SELECT * FROM [T_ADV] WHERE C_STATUS=1 and PK_ADV=" + advID;     
        DataTable dtLink = CMS.SqlCache.FillDataTable(sql);
        CMS.MsSql.ExecuteNonQuery("UPDATE T_ADV SET C_HITS=C_HITS+1 WHERE PK_ADV=" + advID);
        Response.Redirect(dtLink.Rows[0]["C_LINK"].ToString());
    }
   



}
