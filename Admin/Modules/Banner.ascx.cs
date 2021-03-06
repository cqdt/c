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

public partial class Admin_Modules_Banner : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Banners", CMS.TTV.Rules.ONE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền truy cập phần này", this.Page);
            CMS.Utility.HtmlHelper.Back(-1, this.Page);
            return;
        }

        if (!Page.IsPostBack)
        {
            if (Request.QueryString["bID"] != null)
            {
                dvBanner.ChangeMode(DetailsViewMode.Edit);
                dvBanner.HeaderText = "Sửa Banner";
            }
        }
    }

    protected void dvBanner_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            string url = "Default.aspx?ctl=Banners";
            if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
            Response.Redirect(url);
        }
        else if (e.CommandName == "Insert") dvBanner.HeaderText = "Thêm mới Banner";
        else if (e.CommandName == "Edit") dvBanner.HeaderText = "Sửa Banner";
    }

    protected void dvBanner_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string url = "Default.aspx?ctl=Banners&mess=Bạn đã sửa thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        Response.Redirect(url);
    }

    protected void dvBanner_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Banners", CMS.TTV.Rules.APPROVE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền sửa Banner", this.Page);
            e.Cancel = true;
        }
    }

}
