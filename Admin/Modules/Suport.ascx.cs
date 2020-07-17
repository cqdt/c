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

public partial class Admin_Modules_Suport : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Suport", CMS.TTV.Rules.ONE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền truy cập phần này", this.Page);
            CMS.Utility.HtmlHelper.Back(-1, this.Page);
            return;
        }

        if (!Page.IsPostBack)
        {
            if (Request.QueryString["sID"] != null)
            {
                dvSuports.ChangeMode(DetailsViewMode.Edit);
                dvSuports.HeaderText = "Sửa hỗ trợ";
            }
        }
    }

    protected void dvSuports_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            string url = "Default.aspx?ctl=Suports";
            if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
            Response.Redirect(url);
        }
        else if (e.CommandName == "Insert") dvSuports.HeaderText = "Thêm mới ";
        else if (e.CommandName == "Edit") dvSuports.HeaderText = "Sửa quảng";
    }

    protected void dvSuports_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        string url = "Default.aspx?ctl=Suports&mess=Bạn đã thêm mới thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];        
        Response.Redirect(url);
    }

    protected void dvSuports_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Suports", CMS.TTV.Rules.EDIT))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền thêm mới", this.Page);
            e.Cancel = true;
        }      
    }

    protected void dvSuports_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string url = "Default.aspx?ctl=Suports&mess=Bạn đã sửa thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];        
        Response.Redirect(url);
    }

    protected void dvSuports_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Suports", CMS.TTV.Rules.APPROVE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền sửa", this.Page);
            e.Cancel = true;
        }
    }
}
