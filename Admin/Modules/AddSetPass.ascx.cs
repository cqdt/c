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

public partial class Admin_Modules_AddSetPass : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("SetPass", CMS.TTV.Rules.ONE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền truy cập phần này", this.Page);
            CMS.Utility.HtmlHelper.Back(-1, this.Page);
            return;
        }

        if (!Page.IsPostBack)
        {
            if (Request.QueryString["fID"] != null)
            {
                dvAdv.ChangeMode(DetailsViewMode.Edit);
                dvAdv.HeaderText = "Sửa";
            }
        }
    }

    protected void dvAdv_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            string url = "Default.aspx?ctl=SetPass";
            if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];            
            Response.Redirect(url);
        }
        else if (e.CommandName == "Insert") dvAdv.HeaderText = "Thêm mới";
        else if (e.CommandName == "Edit") dvAdv.HeaderText = "Sửa";
    }

    protected void dvAdv_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        string url = "Default.aspx?ctl=SetPass&mess=Bạn đã thêm mới thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];        
        Response.Redirect(url);
    }

    protected void dvAdv_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("SetPass", CMS.TTV.Rules.EDIT))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền thêm mới", this.Page);
            e.Cancel = true;
        }      
    }

    protected void dvAdv_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string url = "Default.aspx?ctl=SetPass&mess=Bạn đã sửa thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];       
        Response.Redirect(url);
    }

    protected void dvAdv_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("SetPass", CMS.TTV.Rules.APPROVE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền sửa", this.Page);
            e.Cancel = true;
        }
    }

}
