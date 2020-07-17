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

public partial class Modules_Base_Tim_viec : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void raddNgaysinh_Load(object sender, EventArgs e)
    {
        Telerik.WebControls.RadDatePicker raddNgaysinh = (Telerik.WebControls.RadDatePicker)sender;
        raddNgaysinh.SelectedDate = System.DateTime.Now;
    }

    protected void raddTu_Load(object sender, EventArgs e)
    {
        Telerik.WebControls.RadDatePicker raddTu = (Telerik.WebControls.RadDatePicker)sender;
        raddTu.SelectedDate = System.DateTime.Now;
    }
    protected void raddDen_Load(object sender, EventArgs e)
    {
        Telerik.WebControls.RadDatePicker raddDen = (Telerik.WebControls.RadDatePicker)sender;
        raddDen.SelectedDate = System.DateTime.Now;
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
