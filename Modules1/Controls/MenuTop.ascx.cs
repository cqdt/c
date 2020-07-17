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

public partial class Modules_Controls_MenuTop : System.Web.UI.UserControl
{
    string control = "Home";
    //public string trangchu = "menutop1";
    //public string gioithieu = "menutop1";
    //public string hoidap = "menutop1";
    //public string tuvan = "menutop1";
    //public string vanban = "menutop1";
    //public string ecflow = "menutop1";
    //public string dowload = "menutop1";
    //int mID;
    public string drophtml = "";
    public string ecolabhtml = "";
    protected void Page_Load(object sender, EventArgs e)
   {
       DataTable dtMenus = CMS.MsSql.FillDataTable("SELECT PK_MENU,C_NAME,C_PARENT,C_ORDER FROM T_MENU WHERE C_STATUS=1");
       int _iMenuID = 1;
       DataRow[] drs = dtMenus.Select("C_PARENT=" + _iMenuID + "", "C_ORDER");
       drophtml += "<ul>";
       for (int i = 0; i < drs.Length; i++)
       {
           drophtml += "<li>";
           int iMenuID = (int)drs[i]["PK_MENU"];
           string strName = drs[i]["C_NAME"].ToString();
           drophtml += "<a href=\"" + Newwind.VQS.GetURL("article", strName, iMenuID) + "\">" + strName + "</a>";
           //GetMenus(dtMenus, iMenuID, strName);
           drophtml += "</li>";
       }
       drophtml += "</ul>";

       DataTable dtMenusE = CMS.MsSql.FillDataTable("SELECT PK_MENU,C_NAME,C_PARENT,C_ORDER,C_LINK FROM T_MENU WHERE C_STATUS=1");
       int _iMenuIDEco = 379;
       DataRow[] drsE = dtMenusE.Select("C_PARENT=" + _iMenuIDEco + "", "C_ORDER");
       ecolabhtml += "<ul>";
       for (int i = 0; i < drsE.Length; i++)
       {
           ecolabhtml += "<li>";
           int iMenuID = (int)drsE[i]["PK_MENU"];
           string strName = drsE[i]["C_NAME"].ToString();
           string C_LINK = drsE[i]["C_LINK"].ToString();

           if (C_LINK != "") ecolabhtml += "<a href='" + C_LINK + "'>" + strName + "</a>";
           else  ecolabhtml += "<a href=\"" + Newwind.VQS.GetURL("tin-tucs", strName, iMenuID) + "\">" + strName + "</a>";
           //GetMenus(dtMenus, iMenuID, strName);
           ecolabhtml += "</li>";
       }
       ecolabhtml += "</ul>"; 

        //if (Request.QueryString["ctl"] != null)
        //{
        //    control = Request.QueryString["ctl"];
        //    mID = CMS.Utils.ToInteger(Request.QueryString["mID"]);
        //}
        //if (((control == "Introduce") && (mID==1)) || ((control == "Introduce") & (mID > 0)))
        //{
        //    gioithieu = "menutop";
        //}

        //else if (control == "FAQ")
        //{
        //    hoidap = "menutop";
        //}
        //else if (control == "Download")
        //{
        //    dowload = "menutop";
        //}
        //else if (control == "Consulting")
        //{
        //    tuvan = "menutop";
        //}
        //else if (control == "Van-ban-lien-quan")
        //{
        //    vanban = "menutop";
        //}
      
        //else 
        //{
        //    trangchu = "menutop";
        //}
       
    }

    void GetMenus(DataTable dtMenus, int Parent, string strParent)
    {
                

        DataRow[] drs = dtMenus.Select("C_PARENT=" + Parent, "C_ORDER");
        

        drophtml += "<ul>";
        for (int i = 0; i < drs.Length; i++)
        {
            int iMenuID = (int)drs[i]["PK_MENU"];
            string strName = drs[i]["C_NAME"].ToString();
           
            drophtml += "<li><a href='" + Newwind.VQS.GetURL("tin-tuc", strName, iMenuID) + "'>" + strName + "</a></li>";
        }
        drophtml += "</ul>";
    }

}
