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

public partial class Modules_Base_Tin_tuyen_dung : System.Web.UI.UserControl
{
    private bool IsBindData = false;
    int tID;
    protected void Page_Load(object sender, EventArgs e)
    {
        tID = CMS.TTV.Web.Utils.GetIntFromQueryString("tID",-1);
        if (!IsBindData) this.Binddata();
    }
    public void Binddata()
    {
        string sql = "select * from T_TUYEN_DUNG where C_STATUS=1";
        if (tID > 0) sql += " and PK_TUYEN_DUNG = " + tID;       
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        this.gvArticles.DataSource = dtNews;
        this.gvArticles.DataKeyNames = new string[] { "PK_TUYEN_DUNG" };
        this.gvArticles.DataBind();
    }
}
