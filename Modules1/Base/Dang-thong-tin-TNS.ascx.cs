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

public partial class Modules_Base_Dang_thong_tin_TNS : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void radNgaysinh_Load(object sender, EventArgs e)
    {
        Telerik.WebControls.RadDatePicker radNgaysinh = (Telerik.WebControls.RadDatePicker)sender;
        radNgaysinh.SelectedDate = System.DateTime.Now;
    }
    protected void dvPOST_TD_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void dvPOST_TD_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {

    }

    protected void dvPOST_TD_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        PnThank.Visible = true;
        pnRegister.Visible = false;
    }

    protected void dvPOST_TD_PreRender(object sender, EventArgs e)
    {

    }
}
