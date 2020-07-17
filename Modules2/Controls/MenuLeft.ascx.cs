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

public partial class Modules_Controls_MenuLeft : System.Web.UI.UserControl
{
    public string strHTMLMenu = "";

    private int _MenuID = -1;
    public int MenuID
    {
        set { _MenuID = value; }
        get { return _MenuID; }
    }

    private bool _AutoLang = false;
    public bool AutoLang
    {
        set { _AutoLang = value; }
        get { return _AutoLang; }
    }

    private string _Type = "";
    public string Type
    {
        set { _Type = value; }
        get { return _Type; }
    }


    int pID = 0;

    bool CheckParent(DataTable dtMenus, int ParentID, int MenuID)
    {
        if (ParentID == MenuID) return true;
        DataRow[] dr = dtMenus.Select("PK_MENU=" + MenuID);
        if (dr.Length > 0)
        {
            int iPrentID = CMS.Utils.ToInteger(dr[0]["C_PARENT"]);
            if (iPrentID == ParentID) return true;
            else return CheckParent(dtMenus, ParentID, iPrentID);
        }
        return false;
    }

    void GetMenus(DataTable dtMenus, int Parent)
    {
        DataRow[] drs = dtMenus.Select("C_PARENT=" + Parent, "C_ORDER");
        for (int i = 0; i < drs.Length; i++)
        {
            int iMenuID = (int)drs[i]["PK_MENU"];
            string strName = drs[i]["C_NAME"].ToString();
            string C_LINK = drs[i]["C_LINK"].ToString();
            DataRow[] dr = dtMenus.Select("C_PARENT=" + iMenuID);
            if (dr.Length > 0)
            {
                if (i == drs.Length - 1) strHTMLMenu += "<div class=\"mnu_left_c1_1_end\" onmouseover=\"expand(this,0);\" onmouseout=\"collapse(this,0);\">";
                else strHTMLMenu += "<div class=\"mnu_left_c1_1\" onmouseover=\"expand(this,0);\" onmouseout=\"collapse(this,0);\">";
                strHTMLMenu += "<div class=\"menuNormal\"><div class=\"khungleft2\">";
                GetMenus(dtMenus, iMenuID);
                strHTMLMenu += "</div></div>";
                if (C_LINK != "") strHTMLMenu += "<a href='" + Newwind.VQS.URL + C_LINK + "' class=\"a_mnu_left2\">" + strName + "</a>";
                else strHTMLMenu += "<a href='" + Newwind.VQS.GetURL("tin-tucs", strName, iMenuID) + "' class=\"a_mnu_left2\">" + strName + "</a>";
                strHTMLMenu += "</div>";
            }
            else
            {
                if (i==drs.Length-1) strHTMLMenu += "<div class=\"mnu_left_c1_end\">";
                else strHTMLMenu += "<div class=\"mnu_left_c1\">";
                if (C_LINK != "") strHTMLMenu += "<a href='" + Newwind.VQS.URL + C_LINK + "' class=\"a_mnu_left2\">" + strName + "</a>";
                else strHTMLMenu += "<a href='" + Newwind.VQS.GetURL("tin-tucs", strName, iMenuID) + "' class=\"a_mnu_left2\">" + strName + "</a>";
                strHTMLMenu += "</div>";
            }
           
        }
    }
  

    public string Title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
            Newwind.VQS vs = new Newwind.VQS();
            pID = vs.GetInt(0);          
            int _iMenuID = _MenuID;

            DataTable dtMenus = CMS.MsSql.FillDataTable("SELECT PK_MENU,C_NAME,C_LINK,C_PARENT,C_ORDER FROM T_MENU WHERE C_STATUS=1 AND C_TYPE='ARTICLE'");
            DataRow[] drs = dtMenus.Select("C_PARENT=" + _iMenuID, "C_ORDER");        
           
            for (int i = 0; i < drs.Length; i++)
            {
                int iMenuID = (int)drs[i]["PK_MENU"];
                string strName = drs[i]["C_NAME"].ToString();
                //string C_LINK = drs[i]["C_LINK"].ToString();
                
                //if (CheckChilden(dtMenus, iMenuID)) // Neu co menu cap 2 thi co mui ten o cuoi
                //{
                //    strHTMLMenu += "<div class=\"khungvuong\"><div class=\"mnu_left_c_1\" onmouseover=\"expand(this,0);\" onmouseout=\"collapse(this,0);\">";                    
                //}
                //else
                //{
                //    strHTMLMenu += "<div class=\"khungvuong\"><div class=\"mnu_left_c\" onmouseover=\"expand(this,0);\" onmouseout=\"collapse(this,0);\">";                    
                //}
                strHTMLMenu += "<div class=\"khungvuong\"><div class=\"mnu_left_c_1\" onmouseover=\"expand(this,0);\" onmouseout=\"collapse(this,0);\">";    
                strHTMLMenu += "<a class=\"a_mnu_left\">" + strName + "</a>";

                if (CheckChilden(dtMenus, iMenuID)) //Neu co menu cap 2 thi goi ham hien thi
                {
                    strHTMLMenu += "<div class=\"menuNormal\"><div class=\"khungleft\">";
                    GetMenus(dtMenus, iMenuID); //hien thi menu cap 2    
                    strHTMLMenu += "</div></div>";  
                }
                strHTMLMenu += "</div></div>";     
            }        
    }

    bool CheckChilden(DataTable dtMenus, int ParentID)
    {
        DataRow[] dr = dtMenus.Select("C_PARENT=" + ParentID);
        if (dr.Length > 0)
        {
            return true;
        }
        else return false;
    }


}
