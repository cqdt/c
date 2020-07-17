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

public partial class Modules_Base_Gallerys : System.Web.UI.UserControl
{
    private int _MenuID = -1;
    public int MenuID
    {
        set { _MenuID = value; }
        get { return _MenuID; }
    }

    private int _Count = -1;
    public int Count
    {
        set { _Count = value; }
        get { return _Count; }
    }


    private int _RowsGrid = 1;
    public int RowsGrid
    {
        set { _RowsGrid = value; }
        get { return _RowsGrid; }
    }

   
    private int _ColumnGrid = 4;
    public int ColumnGrid
    {
        set { _ColumnGrid = value; }
        get { return _ColumnGrid; }
    }

    public int PagerID
    {
        get
        {
            int iPage = CMS.TTV.Web.Utils.GetIntFromQueryString(GetPagerID, 0);
            if (iPage < 0) iPage = 0;
            return iPage;
        }
    }
    public string GetPagerID { get { return this.ClientID.Replace("ctl00_cphMain_ctl00_Gallerys1_dlListTopNews_", "").Replace("ctl00_cphMain_", "") + "_Page"; } }
    public string GetURL
    {
        get
        {
            string strUrl = "";
            string strKey = "";
            string strValue = "";
            for (int i = 0; i < Request.QueryString.Count; i++)
            {
                strKey = Request.QueryString.GetKey(i);
                strValue = Request.QueryString[strKey];
                if (strKey.ToLower() == GetPagerID.ToLower()) continue;
                if (strUrl == "") strUrl = "Default.aspx?" + strKey + "=" + Server.UrlEncode(strValue);
                else strUrl += "&" + strKey + "=" + Server.UrlEncode(strValue);
            }
            return strUrl;
        }
    }

    public int Counts = 0;
    public string strHtmlPage = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Binddata();
    }

    public void Binddata()
    {
        int iPage = CMS.TTV.Web.Utils.GetIntFromQueryString("Page", 0);
        if (iPage < 0) iPage = 0;

        string sql="";
        if (_Count>0) sql= "SELECT TOP " + _Count + " * FROM [T_GALLERY] WHERE C_STATUS=1";
        else sql = "SELECT  * FROM [T_GALLERY] WHERE C_STATUS=1";
        if (_MenuID >= 0) sql += " AND T_GALLERY.FK_MENU=" + _MenuID;
        sql += "order by PK_GALLERY desc";
        DataTable dtProducts = CMS.SqlCache.FillDataTable(sql);
        if (dtProducts != null && dtProducts.Rows.Count > 0)
        {
            Counts = dtProducts.Rows.Count;
        }
        int iRow = _RowsGrid;
        int iColumn = _ColumnGrid;
        int iStart = 0;
        int iEnd = 0;
        int iMaxPage = 100;

        if (_Count < 0)
        {
            this.dlListTopNews.RepeatColumns = 4;
            string url = "Default.aspx?ctl=Gallerys";
            strHtmlPage = TTV.Utils.PageMultiDataList(Counts, iColumn, iRow, PagerID, iMaxPage, GetURL + "&" + GetPagerID, "next", ref iStart, ref iEnd);
            this.dlListTopNews.DataSource = TTV.Utils.DTPage(dtProducts, iStart, iEnd);       
        }
        else
        {
            this.dlListTopNews.DataSource = dtProducts;
        }
        this.dlListTopNews.DataKeyField = "PK_GALLERY";
        this.dlListTopNews.DataBind();
    }
}
