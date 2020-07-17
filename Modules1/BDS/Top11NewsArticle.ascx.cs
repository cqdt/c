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

public partial class Modules_BDS_Top11NewsArticle : System.Web.UI.UserControl
{
    private string _Type = "";
    public string Type
    {
        set { _Type = value; }
        get { return _Type; }
    }


    private int _MenuID = -1;
    public int MenuID
    {
        set { _MenuID = value; }
        get { return _MenuID; }
    }
    public string listothercate = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        Top1News1.MenuID = _MenuID;
        Top1News1.Binddata();
       

        DataTable dtMenus = CMS.MsSql.FillDataTable("SELECT PK_MENU,C_NAME,C_ORDER,C_PARENT FROM T_MENU WHERE C_STATUS=1 AND C_TYPE='ARTICLE'");
        DataRow[] drs = dtMenus.Select("C_PARENT=" + _MenuID, "C_ORDER");

        for (int i = 0; i < drs.Length; i++)
        {
            int iMenuID = (int)drs[i]["PK_MENU"];
                        string strName = drs[i]["C_NAME"].ToString();


            if (i == drs.Length - 1) listothercate += "<a href='" + Newwind.VQS.GetURL("tin-tucs", strName, iMenuID) + "' class=\"a_title_other_cate\">" + strName + "</a>";
            else listothercate += "<a href='" + Newwind.VQS.GetURL("tin-tucs", strName, iMenuID) + "' class=\"a_title_other_cate\">" + strName + "</a>" + " <a class=\"a_title_other_cate\">|</a> ";

        }

    }



}
