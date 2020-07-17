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

public partial class Modules_Base_Tu_nghiep_sinhs : System.Web.UI.UserControl
{
    private string _nghenhiep = "";
    public string Nghenhiep
    {
        set { _nghenhiep = value; }
        get { return _nghenhiep; }
    }
    private string _bangcap = "";
    public string Bangcap
    {
        set { _bangcap = value; }
        get { return _bangcap; }
    }
    private string _kinhnghiem = "";
    public string Kinhnghiem
    {
        set { _kinhnghiem = value; }
        get { return _kinhnghiem; }
    }

    private string _gioitinh = "";
    public string Gioitinh
    {
        set { _gioitinh = value; }
        get { return _gioitinh; }
    }
    private bool IsBindData = false;
    int hID;
    protected void Page_Load(object sender, EventArgs e)
    {
        hID = CMS.TTV.Web.Utils.GetIntFromQueryString("hID", -1);
        if (!IsBindData) this.Binddata();
    }
    public void Binddata()
    {
        string sql = "select * from T_TNS where C_STATUS=1 ";
        if (hID > 0) sql += " and PK_TNS <> " + hID;
        if (_nghenhiep != "") sql += " AND (C_NGHE_NGHIEP LIKE N'%" + _nghenhiep + "%')";
        if (_bangcap != "") sql += " AND (C_BANG_CAP LIKE N'%" + _bangcap + "%')";
        if (_kinhnghiem != "") sql += " AND (C_KINH_NGHIEM LIKE N'%" + _kinhnghiem + "%')";
        if (_gioitinh != "") sql += " AND (C_GIOI_TINH LIKE N'%" + _gioitinh + "%')";
        sql += " order by PK_TNS desc";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        this.gvArticles.DataSource = dtNews;
        this.gvArticles.DataKeyNames = new string[] { "PK_TNS" };
        this.gvArticles.DataBind();
        IsBindData = true;
    }
}
