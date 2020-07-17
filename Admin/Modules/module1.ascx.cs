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

public partial class Admin_Modules_module1 : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["fID"] != null)
            {
                dvAdv.ChangeMode(DetailsViewMode.Edit);
                dvAdv.HeaderText = "Sửa quảng cáo";
            }
        }
    }
    protected void dvAdv_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        string url = "Default.aspx?ctl=module";
        Response.Redirect(url);
    }

    protected void dvAdv_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
      
    }

    protected void dvAdv_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string url = "Default.aspx?ctl=module";
        Response.Redirect(url);
    }

    protected void dvAdv_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("module", CMS.TTV.Rules.APPROVE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền sửa quảng cáo", this.Page);
            e.Cancel = true;
        }
    }
    protected void dvAdv_PreRender(object sender, EventArgs e)
    {
      
    }
    protected void gvAdvs_PreRender(object sender, EventArgs e)
    {

    }
    protected void dvAdv_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            string url = "Default.aspx?ctl=module";
           
            Response.Redirect(url);
        }
        else if (e.CommandName == "Insert") dvAdv.HeaderText = "Thêm mới quảng cáo";
        else if (e.CommandName == "Edit") dvAdv.HeaderText = "Sửa quảng cáo";
    }
}
