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

public partial class Modules_Base_Dang_ky_cap_chung_chi_CE : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void raddNgaysinh_Load(object sender, EventArgs e)
    {
        Telerik.WebControls.RadDatePicker raddNgaysinh = (Telerik.WebControls.RadDatePicker)sender;
        raddNgaysinh.SelectedDate = System.DateTime.Now;
    }
    protected void dvRegister_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void dvRegister_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        
    }

    protected void dvRegister_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        PnThank.Visible = true;
        pnRegister.Visible = false;
    }
}
