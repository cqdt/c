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


public partial class Modules_Lich_cong_tac_tuan : System.Web.UI.UserControl
{
    public delegate void PageIndex(int index);
    public event PageIndex PageIndexChange;

   
    private bool IsBindData = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsBindData) this.Binddata();
    }

    public void Binddata()
    {
        string sql = "SELECT * from T_LICH where C_STATUS=1 order by PK_LICH desc";
        

        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        this.gvLichs.DataSource = dtNews;
        this.gvLichs.DataKeyNames = new string[] { "PK_LICH" };       
        this.gvLichs.DataBind();       
        IsBindData = true;
    }

    protected void gvLichs_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.gvLichs.PageIndex = e.NewPageIndex;
        this.gvLichs.DataBind();       
        
    }
    
}
