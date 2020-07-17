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

public partial class Modules_Base_SiteMap : System.Web.UI.UserControl
{
    void GetMenu(int iLangID, DataTable dtMenus, int MenuID, string UrlA, string UrlM, int iSTT, TreeNode tnMenu, int Index)
    {
        int j = -1;
        DataRow[] dr;

        dr = CMS.SqlCache.FillDataRows("SELECT PK_ARTICLE,C_TITLE FROM T_ARTICLE WHERE C_STATUS=1 AND FK_MENU=" + MenuID + " ORDER BY C_ORDER");
        if (dr != null)
        {
            for (int i = 0; i < dr.Length; i++)
            {
                j++;
                string strName = dr[i]["C_TITLE"].ToString();
                string url = UrlA + dr[i]["PK_ARTICLE"].ToString();

                TreeNode tnMenuItem = new TreeNode(strName, strName);
                tnMenuItem.NavigateUrl = url;
                tnMenuItem.Expanded = false;
                tnMenu.ChildNodes.Add(tnMenuItem);
            }

        }

        int iIndex = Index + 1;
        dr = dtMenus.Select("C_STATUS=1 AND C_PARENT=" + MenuID, "C_ORDER");
        for (int i = 0; i < dr.Length; i++)
        {
            j++;
            string strName = dr[i]["C_NAME"].ToString();
            int iMenuID = CMS.Utils.ToInteger(dr[i]["PK_MENU"]);
            string url = UrlM + iMenuID;

            TreeNode tnMenuItem = new TreeNode(strName, strName);
            tnMenuItem.NavigateUrl = url;
            tnMenuItem.Expanded = false;
            tnMenu.ChildNodes.Add(tnMenuItem);

            url = "~/Default.aspx?ctl=FIAs&TabID=" + iSTT + "&mID=" + iMenuID + "&aID=";
            if (iIndex >= 2)
            {
                DataRow[] dr2 = dtMenus.Select("C_STATUS=1 AND C_PARENT=" + iMenuID, "C_ORDER");
                if (dr != null)
                {
                    if (dr.Length > 0)
                    {
                        url = "~/Default.aspx?ctl=Article&TabID=" + iSTT + "&mID=" + MenuID + "&m2ID=" + iMenuID + "&aID=";
                    }
                }
            }
            GetMenu(iLangID, dtMenus, iMenuID, url, "~/Default.aspx?ctl=FIA&TabID=" + iSTT + "&mID=" + iMenuID + "&m2ID=", iSTT, tnMenu.ChildNodes[j], iIndex);
        }
    }

    int GetMenuIDFromMenuID(DataTable dtMenus2, int MenuID, int LangID)
    {
        DataRow[] dr = dtMenus2.Select("FK_MENU=" + MenuID + " AND FK_LANG=" + LangID);
        if (dr.Length > 0) return CMS.Utils.ToInteger(dr[0]["PK_MENU"]);
        return -1;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           // tvMenu.Nodes[0].Text = TTV.Utils.ToUpper(CMS.Lang.GetKey("Top.ascx", "Trang_chu"));
           // tvMenu.Nodes[0].ChildNodes[0].Text = TTV.Utils.ToUpper(CMS.Lang.GetKey("Top.ascx", "Gioi_thieu"));
           // tvMenu.Nodes[0].ChildNodes[1].Text = TTV.Utils.ToUpper(CMS.Lang.GetKey("Top.ascx", "Tin_tuc_va_Su_kien"));
           // tvMenu.Nodes[0].ChildNodes[2].Text = TTV.Utils.ToUpper(CMS.Lang.GetKey("MenuTop.ascx", "Ve_viet_nam"));
           // tvMenu.Nodes[0].ChildNodes[3].Text = TTV.Utils.ToUpper(CMS.Lang.GetKey("MenuTop.ascx", "Co_hoi_dau_tu"));
           // tvMenu.Nodes[0].ChildNodes[4].Text = TTV.Utils.ToUpper(CMS.Lang.GetKey("MenuTop.ascx", "Chinh_sach_dau_tu"));
           // tvMenu.Nodes[0].ChildNodes[5].Text = TTV.Utils.ToUpper(CMS.Lang.GetKey("MenuTop.ascx", "Thu_tuc_dau_tu"));
           // tvMenu.Nodes[0].ChildNodes[6].Text = TTV.Utils.ToUpper(CMS.Lang.GetKey("MenuTop.ascx", "Quan_ly_nha_nuoc"));
           // tvMenu.Nodes[0].ChildNodes[7].Text = CMS.Lang.GetKey("MenuTop.ascx", "FDI_viet_nam");
           //tvMenu.Nodes[0].ChildNodes[8].Text = TTV.Utils.ToUpper(CMS.Lang.GetKey("MenuTop.ascx", "Xuc_tien_dau_tu_Hop_tac_QT"));
           // tvMenu.Nodes[0].ChildNodes[9].Text = TTV.Utils.ToUpper(CMS.Lang.GetKey("MenuTop.ascx", "Hoi_nhap_kinh_te_QT"));
           // tvMenu.Nodes[0].ChildNodes[10].Text = TTV.Utils.ToUpper(CMS.Lang.GetKey("Home.ascx", "Dau_Tu_Ra_Nuoc_Ngoai"));
           // tvMenu.Nodes[0].ChildNodes[11].Text = TTV.Utils.ToUpper(CMS.Lang.GetKey("Default.aspx", "Van_ban_phap_luat"));
           // tvMenu.Nodes[0].ChildNodes[12].Text = TTV.Utils.ToUpper(CMS.Lang.GetKey("Top.ascx", "Hoi_dap"));
           // tvMenu.Nodes[0].ChildNodes[13].Text = TTV.Utils.ToUpper(CMS.Lang.GetKey("Top.ascx", "Lien_ket"));
           // tvMenu.Nodes[0].ChildNodes[14].Text = TTV.Utils.ToUpper(CMS.Lang.GetKey("Top.ascx", "SiteMap"));
           // tvMenu.Nodes[0].ChildNodes[15].Text = TTV.Utils.ToUpper(CMS.Lang.GetKey("Top.ascx", "Lien_he"));
        }

        if (!Page.IsPostBack)
        {
            //if (Request.QueryString["TabID"] != null) TabID = CMS.Utils.ToInteger(Request.QueryString["TabID"]);
            int iLangID = CMS.Lang.LangValue;
            DataTable dtMenus = CMS.TTV.Web.Menu.GetListMenuFromLangID(iLangID);
            DataTable dtMenus2 = CMS.SqlCache.FillDataTable("SELECT * FROM T_MENU");

            int MenuID = 6;
            if (iLangID != 1) MenuID = GetMenuIDFromMenuID(dtMenus2, MenuID, iLangID);
            GetMenu(iLangID, dtMenus, MenuID, "~/Default.aspx?ctl=Products&pID=", "~/Default.aspx?ctl=Products&pID=", 0, tvMenu.Nodes[0].ChildNodes[2], 0);
            
            //MenuID = 6;
            //if (iLangID != 1) MenuID = GetMenuIDFromMenuID(dtMenus2, MenuID, iLangID);
            //GetMenu(iLangID, dtMenus, MenuID, "~/Default.aspx?ctl=Article&TabID=0&aID=", "~/Default.aspx?ctl=FIA&TabID=0&m2ID=", 6, tvMenu.Nodes[0].ChildNodes[3], 0);
         
            //MenuID = 5;
            //if (iLangID != 1) MenuID = GetMenuIDFromMenuID(dtMenus2, MenuID, iLangID);
            //GetMenu(iLangID, dtMenus, MenuID, "~/Default.aspx?ctl=Article&TabID=7&aID=", "~/Default.aspx?ctl=FIA&TabID=7&mID=", 7, tvMenu.Nodes[0].ChildNodes[2], 0);
           
            //MenuID = 1;
            //if (iLangID != 1) MenuID = GetMenuIDFromMenuID(dtMenus2, MenuID, iLangID);
            //GetMenu(iLangID, dtMenus, MenuID, "~/Default.aspx?ctl=Article&TabID=2&aID=", "~/Default.aspx?ctl=FIA&TabID=2&mID=", 2, tvMenu.Nodes[0].ChildNodes[6], 0);
           
            //MenuID = 4;
            //if (iLangID != 1) MenuID = GetMenuIDFromMenuID(dtMenus2, MenuID, iLangID);
            //GetMenu(iLangID, dtMenus, MenuID, "~/Default.aspx?ctl=Article&TabID=3&aID=", "~/Default.aspx?ctl=FIA&TabID=3&mID=", 1, tvMenu.Nodes[0].ChildNodes[1], 0);           
            //MenuID = 9;
            //if (iLangID != 1) MenuID = GetMenuIDFromMenuID(dtMenus2, MenuID, iLangID);
            //GetMenu(iLangID, dtMenus, MenuID, "~/Default.aspx?ctl=Article&TabID=5&aID=", "~/Default.aspx?ctl=FIA&TabID=5&mID=", 5, tvMenu.Nodes[0].ChildNodes[4], 0);
           
            //MenuID = 10;
            //if (iLangID != 1) MenuID = GetMenuIDFromMenuID(dtMenus2, MenuID, iLangID);
            //GetMenu(iLangID, dtMenus, MenuID, "~/Default.aspx?ctl=Article&TabID=6&aID=", "~/Default.aspx?ctl=FIA&TabID=6&mID=", 6, tvMenu.Nodes[0].ChildNodes[5], 0);            

            //string strName = CMS.Lang.GetKey("MenuTop.ascx", "Du_an_keu_goi_dau_tu");
            //TreeNode tnMenuItem = new TreeNode(strName, strName);
            //tnMenuItem.NavigateUrl = "~/Default.aspx?ctl=Project&TabID=1";
            //tvMenu.Nodes[0].ChildNodes[3].ChildNodes.Add(tnMenuItem);
            //strName = CMS.Lang.GetKey("MenuTop.ascx", "Nha_dau_tu_tu_gioi_thieu");
            //tnMenuItem = new TreeNode(strName, strName);
            //tnMenuItem.NavigateUrl = "~/Default.aspx?ctl=Investor&TabID=1";
            //tvMenu.Nodes[0].ChildNodes[3].ChildNodes.Add(tnMenuItem);
        }
    }
}
