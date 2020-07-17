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


public partial class Modules_Chi_tiet_lich_cong_tac_tuan : System.Web.UI.UserControl
{
    private bool IsBindData = false;
    public string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsBindData) this.Binddata();
    }
     public void Binddata()
    {
        string sql = "select * from T_LICH where C_STATUS=1 and PK_LICH=" + CMS.Utils.ToInteger(Request.QueryString["lID"]);
       
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
         if (dtNews.Rows.Count>0) 
             {
                 title = dtNews.Rows[0]["C_NAME"].ToString();
             }
        this.dlTop1News.DataSource = dtNews;
        this.dlTop1News.DataBind();
        IsBindData = true; 
    }
}
