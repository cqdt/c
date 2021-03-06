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

public partial class Admin_Modules_Order : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Orders", CMS.TTV.Rules.VIEW))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền xem thông tin đặt hàng", this.Page);
            CMS.Utility.HtmlHelper.Back(-1, this.Page);
            return;
        }
    }

    protected void dvOrder_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            string url = "Default.aspx?ctl=Orders";
            if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
            Response.Redirect(url);
        }
    }

    protected void dvOrder_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string url = "Default.aspx?ctl=Orders";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        Response.Redirect(url);
    }

    protected void gvOrders_RowCreated(object sender, GridViewRowEventArgs e)
    {
        GridView gvOrders = (GridView)sender;
        if (e.Row.RowIndex >= 0 && e.Row.RowIndex <= gvOrders.Rows.Count)
        {
            e.Row.Cells[0].Text = "<font face=\"tahoma\" size=\"2\">" + (gvOrders.PageIndex * gvOrders.PageSize + e.Row.RowIndex + 1) + "</font>";
        }
    }

}
