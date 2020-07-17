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

public partial class Modules_Base_MenuRight : System.Web.UI.UserControl
{
    private int _MenuID = -1;
    public int MenuID
    {
        set { _MenuID = value; }
        get { return _MenuID; }
    }
    public string drophtml = "";
    public string menucha = "";
    public void mocmenucon(int idcha)
    {
        DataTable dtMenusE = CMS.MsSql.FillDataTable("SELECT PK_MENU,C_NAME,C_PARENT,C_ORDER,C_LINK,C_RSS FROM T_MENU WHERE C_STATUS=1");
        DataRow[] drsE = dtMenusE.Select("C_PARENT=" + idcha + "", "C_ORDER");
        if (drsE.Length > 0)
        {
            menucha += "<div class='sub_left sub_left" + idcha + "'>";
            for (int i = 0; i < drsE.Length; i++)
            {
                menucha += " <div class='item_left'>";
                int iMenuID = (int)drsE[i]["PK_MENU"];
                string strName = drsE[i]["C_NAME"].ToString();
                string C_LINK = drsE[i]["C_LINK"].ToString();
                menucha += "<i class='fa fa-caret-right' aria-hidden='true'></i>";
                if (idcha == 406)
                {
                    if (drsE[i]["C_RSS"].ToString() == "False")
                    {
                        if (C_LINK != "") menucha += "<a onclick='newwin()'  class='a_eps'>" + strName + "</a>";
                        else
                            menucha += "<a  class='a_eps' onclick='newwin()'>" + strName + "</a>";
                    }
                    else
                    {
                        if (C_LINK != "") menucha += "<a href='" + C_LINK + "' class='a_eps'>" + strName + "</a> <span style='padding: 20px;color: red;'> Đang tiếp nhận hồ sơ</span>";
                        else
                            menucha += "<a href=\"" + Newwind.VQS.GetURL("tin-tuc", strName, iMenuID) + "\" class='a_eps'>" + strName + "</a> <span style='padding: 20px;color: red;'> Đang tiếp nhận hồ sơ</span> ";
                        //CMS.Utility.HtmlHelper.Alert("Bạn không có quyền thêm mới quảng cáo", this.Page);
                    }
                }
                else
                {

                    if (drsE[i]["C_RSS"].ToString() == "False")
                    {
                        if (C_LINK != "") menucha += "<a href='" + C_LINK + "'  class='a_eps'>" + strName + "</a>";
                        else
                            menucha += "<a  class='a_eps' href=\"" + Newwind.VQS.GetURL("tin-tucs", strName, iMenuID) + "\">" + strName + "</a>";
                    }
                    else
                    {
                        if (C_LINK != "") menucha += "<a href='" + C_LINK + "' class='a_eps'>" + strName + "</a>";
                        else
                            menucha += "<a href=\"" + Newwind.VQS.GetURL("tin-tuc", strName, iMenuID) + "\" class='a_eps'>" + strName + "</a>";
                        //CMS.Utility.HtmlHelper.Alert("Bạn không có quyền thêm mới quảng cáo", this.Page);
                    }
                }
                
                menucha += "</div>";
            }
            menucha += "</div>";
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        DataTable dtCate = CMS.MsSql.FillDataTable("select * from T_MENU where C_PARENT=" + MenuID + " ORDER BY C_ORDER ASC ");
        DataRow[] drCate = dtCate.Select();
        if (drCate.Length > 0)
        {
            for (int j = 0; j < drCate.Length; j++)
            {
                int iMenuID1 = (int)drCate[j]["PK_MENU"];
                string strName1 = drCate[j]["C_NAME"].ToString();
                string anhbnn = drCate[j]["C_IMAGE_FILE_NAME"].ToString();
                string C_LINK = drCate[j]["C_LINK"].ToString().Trim();
                if (anhbnn.Length > 2) anhbnn = Newwind.VQS.URL + "/" + anhbnn.Substring(2);
                menucha += "<div class='banner_left btn_subleft' leftID='" + iMenuID1 + "'>";



                if (C_LINK != "") menucha += "<a href='" + C_LINK + "' class='a_eps'><img src='" + anhbnn + "'' width='100%'  alt='" + strName1 + "' /></a>";
                else
                    menucha += "<img src='" + anhbnn + "'' width='100%'  alt='" + strName1 + "' />";





                menucha += "</div>";
                mocmenucon(iMenuID1);
            }
        }


    }

}