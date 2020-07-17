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

public partial class Modules_Base_List_dang_ky_kiem_tra_tieng_han : System.Web.UI.UserControl
{
    private string _Search = "";
    public string Search
    {
        set { _Search = value; }
        get { return _Search; }
    }
    private string _SBD = "";
    public string SBD
    {
        set { _SBD = value; }
        get { return _SBD; }
    }
    private bool IsBindData = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsBindData) this.Binddata();
    }
    public void Binddata()
    {
        string sql = "select * from T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN where C_STATUS=1";
        if (_SBD != "") sql += " AND (T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN.C_SBD ='" + _SBD + "')";
        else return;        
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        this.gvArticles.DataSource = dtNews;
        this.gvArticles.DataKeyNames = new string[] { "PK_DANG_KY" };
        this.gvArticles.DataBind();
    }
}
