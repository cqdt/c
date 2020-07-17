using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Modules_khai_bao_lan_cuoi_de_hoi_huong : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string kq = CMS.TTV.Web.Utils.GetStringFromQueryString("kq", "");
        if (kq == "1")
        {
            successful.Visible = true;
            unsuccessful.Visible = false;
        }
        else if (kq == "0")
        {
            successful.Visible = false;
            unsuccessful.Visible = true;
        }
    }
}