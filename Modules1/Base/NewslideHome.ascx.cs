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

public partial class Modules_Base_NewslideHome : System.Web.UI.UserControl
{
    private int _MenuID = -1;
    public int MenuID
    {
        set { _MenuID = value; }
        get { return _MenuID; }
    }
    public string newheadlines = "";
    public string newpreview = "";
    public string imgnew = "";
    public int dem = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Binddata();
        string sql = "SELECT TOP 8 T_ARTICLE.*,T_MENU.C_NAME AS C_NAME_MENU FROM [T_ARTICLE],T_MENU WHERE T_MENU.PK_MENU=T_ARTICLE.FK_MENU AND T_ARTICLE.C_STATUS=1";

        string strIDs = "";
        CMS.TTV.Web.Menu.GetListMenuID(null, _MenuID, ref strIDs);
        if (strIDs != "") strIDs = strIDs + "-1";
        if (_MenuID >= 0) sql += " AND T_ARTICLE.FK_MENU IN (" + strIDs + ")";

        sql += " ORDER BY T_ARTICLE.PK_ARTICLE DESC";
        DataTable dtNews = CMS.MsSql.FillDataTable(sql);
        this.dlTop1News.DataSource = dtNews;
        this.dlTop1News.DataBind();
        //if (dem > 3)
        //{
        //    imgnew = "<img src=\"" + Newwind.VQS.URL + "/images/new.gif" + "\" alt=\"new\" class=\"iconnew\" />";
        //}
        //else imgnew = "";
    }
    public string dem1(object kkk)
    {
        string k1 = kkk.ToString();
        if (k1 =="True")
        {
            imgnew = "<img src=\"" + Newwind.VQS.URL + "/images/new.gif" + "\" alt=\"new\" class=\"iconnew\" />";
        }
        else imgnew = "";
        return imgnew;

    }
    public void Binddata()
    {
        string sql = "SELECT TOP 6 T_ARTICLE.*,T_MENU.C_NAME AS C_NAME_MENU FROM [T_ARTICLE],T_MENU WHERE T_MENU.PK_MENU=T_ARTICLE.FK_MENU AND T_ARTICLE.C_STATUS=1 and C_HOT=1";

        string strIDs = "";
        CMS.TTV.Web.Menu.GetListMenuID(null, _MenuID, ref strIDs);
        if (strIDs != "") strIDs = strIDs + "-1";
        if (_MenuID >= 0) sql += " AND T_ARTICLE.FK_MENU IN (" + strIDs + ")";

        sql += " ORDER BY T_ARTICLE.PK_ARTICLE DESC";
        DataTable dtNews = CMS.MsSql.FillDataTable(sql);
        if (dtNews != null && dtNews.Rows.Count > 0)
        {
            for (int i = 0; i < dtNews.Rows.Count; i++)
            {
                int c_moi = CMS.Utils.ToInteger(dtNews.Rows[i]["C_MOI"]);                       
                if (i == 0)
                {
                    newpreview += "<div class=\"news-content top-content\">";
                    newpreview += "<a href=\"" + Newwind.VQS.GetURL("tin-tuc", CMS.Utils.ToString(dtNews.Rows[i]["C_TITLE"]), CMS.Utils.ToInteger(dtNews.Rows[i]["PK_ARTICLE"])) + "\">" + CMS.TTV.Web.Utils.CreateLink(TTV.Utils.CheckEmtyImage(dtNews.Rows[i]["C_IMAGE_FILE_NAME"]), 172, 0, 0, "img_top1new", true) + "</a>";
                    newpreview += "</div>";
                }
                else
                {
                    newpreview += "<div class=\"news-content\">";
                    newpreview += "<a href=\"" + Newwind.VQS.GetURL("tin-tuc", CMS.Utils.ToString(dtNews.Rows[i]["C_TITLE"]), CMS.Utils.ToInteger(dtNews.Rows[i]["PK_ARTICLE"])) + "\">" + CMS.TTV.Web.Utils.CreateLink(TTV.Utils.CheckEmtyImage(dtNews.Rows[i]["C_IMAGE_FILE_NAME"]), 172, 0, 0, "img_top1new", true) + "</a>";
                    newpreview += "</div>";
                }
            }
        }
    }
}