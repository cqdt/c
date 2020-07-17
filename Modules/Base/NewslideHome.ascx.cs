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

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Binddata();
    }

    public void Binddata()
    {
        string sql = "SELECT TOP 6 T_ARTICLE.*,T_MENU.C_NAME AS C_NAME_MENU FROM [T_ARTICLE],T_MENU WHERE T_MENU.PK_MENU=T_ARTICLE.FK_MENU AND T_ARTICLE.C_STATUS=1";

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

                int c_moi = CMS.Utils.ToInteger(dtNews.Rows[i]["C_HOT"]);                

                if (i == 0)
                {
                    if (c_moi == 1)
                    {
                        newheadlines += "<li class=\"selected\" ><a href=\"" + Newwind.VQS.GetURL("tin-tuc", CMS.Utils.ToString(dtNews.Rows[i]["C_TITLE"]), CMS.Utils.ToInteger(dtNews.Rows[i]["PK_ARTICLE"])) + "\">" + CMS.TTV.Web.Utils.CreateLink(TTV.Utils.CheckEmtyImage(dtNews.Rows[i]["C_IMAGE_FILE_NAME"]), 0, 0, 0, "img_top1new", true) + "" + CMS.TTV.Web.Utils.Cut(dtNews.Rows[i]["C_TITLE"], 65) + "<img src='" + Newwind.VQS.URL + "/images/new.gif' alt='new' class='iconnew1' style='margin-bottom:-8px'></a></li>";
                    }
                    else
                    {

                        newheadlines += "<li class=\"selected\" ><a href=\"" + Newwind.VQS.GetURL("tin-tuc", CMS.Utils.ToString(dtNews.Rows[i]["C_TITLE"]), CMS.Utils.ToInteger(dtNews.Rows[i]["PK_ARTICLE"])) + "\">" + CMS.TTV.Web.Utils.CreateLink(TTV.Utils.CheckEmtyImage(dtNews.Rows[i]["C_IMAGE_FILE_NAME"]), 0, 0, 0, "img_top1new", true) + "" + CMS.TTV.Web.Utils.Cut(dtNews.Rows[i]["C_TITLE"], 65) + "</a></li>";
                    }
                }
                else
                {
                    if (c_moi ==1)
                    {
                        newheadlines += "<li><a href=\"" + Newwind.VQS.GetURL("tin-tuc", CMS.Utils.ToString(dtNews.Rows[i]["C_TITLE"]), CMS.Utils.ToInteger(dtNews.Rows[i]["PK_ARTICLE"])) + "\">" + CMS.TTV.Web.Utils.CreateLink(TTV.Utils.CheckEmtyImage(dtNews.Rows[i]["C_IMAGE_FILE_NAME"]), 0, 0, 0, "img_top1new", true) + " " + CMS.TTV.Web.Utils.Cut(dtNews.Rows[i]["C_TITLE"], 65) + "<img src='" + Newwind.VQS.URL + "/images/new.gif' alt='new' class='iconnew1' style='margin-bottom:-8px' ></a></li>";
                    }
                    else
                    {
                        newheadlines += "<li><a href=\"" + Newwind.VQS.GetURL("tin-tuc", CMS.Utils.ToString(dtNews.Rows[i]["C_TITLE"]), CMS.Utils.ToInteger(dtNews.Rows[i]["PK_ARTICLE"])) + "\">" + CMS.TTV.Web.Utils.CreateLink(TTV.Utils.CheckEmtyImage(dtNews.Rows[i]["C_IMAGE_FILE_NAME"]), 0, 0, 0, "img_top1new", true) + " " + CMS.TTV.Web.Utils.Cut(dtNews.Rows[i]["C_TITLE"], 65) + "</a></li>";

                    }
                }                
                if (i == 0)
                {
                    newpreview += "<div class=\"news-content top-content\">";
                    newpreview += "<div class='description_slide'><a class=\"text_top1\" href=\"" + Newwind.VQS.GetURL("tin-tuc", CMS.Utils.ToString(dtNews.Rows[i]["C_TITLE"]), CMS.Utils.ToInteger(dtNews.Rows[i]["PK_ARTICLE"])) + "\">" + dtNews.Rows[i]["C_TITLE"] + "</a>";
                    //newpreview += "<p class=\"head_topnews\">" + dtNews.Rows[i]["C_HEAD"].ToString() + "</p>";
                    newpreview += "</div><a href=\"" + Newwind.VQS.GetURL("tin-tuc", CMS.Utils.ToString(dtNews.Rows[i]["C_TITLE"]), CMS.Utils.ToInteger(dtNews.Rows[i]["PK_ARTICLE"])) + "\">" + CMS.TTV.Web.Utils.CreateLink(TTV.Utils.CheckEmtyImage(dtNews.Rows[i]["C_IMAGE_FILE_NAME"]), 0, 0, 0, "img_top1new", true) + "</a>";
                    newpreview += "</div>";
                }
                else
                {
                    newpreview += "<div class=\"news-content\">";
                    newpreview += "<div class='description_slide'><a class=\"text_top1\" href=\"" + Newwind.VQS.GetURL("tin-tuc", CMS.Utils.ToString(dtNews.Rows[i]["C_TITLE"]), CMS.Utils.ToInteger(dtNews.Rows[i]["PK_ARTICLE"])) + "\">" + dtNews.Rows[i]["C_TITLE"] + "</a>";
                    //newpreview += "<p class=\"head_topnews\">" + dtNews.Rows[i]["C_HEAD"].ToString() + "</p>";
                    newpreview += "</div><a href=\"" + Newwind.VQS.GetURL("tin-tuc", CMS.Utils.ToString(dtNews.Rows[i]["C_TITLE"]), CMS.Utils.ToInteger(dtNews.Rows[i]["PK_ARTICLE"])) + "\">" + CMS.TTV.Web.Utils.CreateLink(TTV.Utils.CheckEmtyImage(dtNews.Rows[i]["C_IMAGE_FILE_NAME"]), 0, 0, 0, "img_top1new", true) + "</a>";
                    newpreview += "</div>";
                }
            }
        }
    }
}