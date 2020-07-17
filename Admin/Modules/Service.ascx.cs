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

public partial class Admin_Modules_Service : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Services", CMS.TTV.Rules.ONE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền truy cập phần này", this.Page);
            CMS.Utility.HtmlHelper.Back(-1, this.Page);
            return;
        }

        if (!Page.IsPostBack)
        {
            if (Request.QueryString["sID"] != null)
            {
                dvService.ChangeMode(DetailsViewMode.Edit);
                dvService.HeaderText = "Sửa giá dịch vụ";
            }
        }
    }
    protected void dvService_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            string url = "Default.aspx?ctl=Services";
            if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
            if (Request.QueryString["PageSize"] != null) url += "&PageSize=" + Request.QueryString["PageSize"];            
            Response.Redirect(url);
        }
        else if (e.CommandName == "Insert") dvService.HeaderText = "Thêm mới sản phẩm";
        else if (e.CommandName == "Edit") dvService.HeaderText = "Sửa sản phẩm";
    }

    protected void dvService_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        string url = "Default.aspx?ctl=Services&mess=Bạn đã thêm mới thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        if (Request.QueryString["PageSize"] != null) url += "&PageSize=" + Request.QueryString["PageSize"];        
        Response.Redirect(url);
    }

    protected void dvService_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Services", CMS.TTV.Rules.EDIT))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền thêm mới dịch vụ", this.Page);
            e.Cancel = true;
        }
    }

    protected void dvService_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string url = "Default.aspx?ctl=Services&mess=Bạn đã sửa thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        if (Request.QueryString["PageSize"] != null) url += "&PageSize=" + Request.QueryString["PageSize"];        
        Response.Redirect(url);
    }

    protected void dvService_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Services", CMS.TTV.Rules.APPROVE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền sửa giá", this.Page);
            e.Cancel = true;
        }
    }
}
