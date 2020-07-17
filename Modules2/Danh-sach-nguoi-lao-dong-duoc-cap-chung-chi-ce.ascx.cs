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

public partial class Modules_Danh_sach_nguoi_lao_dong_duoc_cap_chung_chi_ce : System.Web.UI.UserControl
{
   
    protected void Page_Load(object sender, EventArgs e)
    {     
        List1.Visible = true;
        Searchce1.Visible = true;       
        string strHoten = CMS.TTV.Web.Utils.GetStringFromQueryString("hoten", "").Replace("'", "''");
        string strShc = CMS.TTV.Web.Utils.GetStringFromQueryString("shc", "").Replace("'", "''");        
        string strMaTT = CMS.TTV.Web.Utils.GetStringFromQueryString("mtt", "").Replace("'", "''");
        string strTn = CMS.TTV.Web.Utils.GetStringFromQueryString("tn", "").Replace("'", "''");
        string strDn = CMS.TTV.Web.Utils.GetStringFromQueryString("dn", "").Replace("'", "''");
        List1.Hoten = strHoten;
        List1.SoHC = strShc;
        List1.MaTTDT = strMaTT;
        List1.Tn = strTn;
        List1.Dn = strDn;
        
    }   
 }
