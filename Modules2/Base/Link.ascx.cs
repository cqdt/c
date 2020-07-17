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

public partial class Modules_Base_Link : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Binddata();
    }

    public void Binddata()
    {
        string sql = "select * from T_LINK where C_STATUS=1 order by C_ORDER";
        DataTable dtLinks = CMS.SqlCache.FillDataTable(sql);
        this.gvLinks.DataSource = dtLinks;
        this.gvLinks.DataKeyNames = new string[] { "PK_LINK" };
        this.gvLinks.DataBind();
    }
    //protected void gvLinks_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    this.Binddata();
    //    this.gvLinks.PageIndex = e.NewPageIndex;
    //    this.gvLinks.DataBind();
    //}

}
