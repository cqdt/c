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

public partial class Admin_Modules_Tu_nghiep_sinh : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Tu-nghiep-sinhs", CMS.TTV.Rules.ONE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền truy cập phần này", this.Page);
            CMS.Utility.HtmlHelper.Back(-1, this.Page);
            return;
        }

        if (!Page.IsPostBack)
        {
            if (Request.QueryString["fID"] != null)
            {
                dvRegister.ChangeMode(DetailsViewMode.Edit);
                dvRegister.HeaderText = "Sửa";
            }
        }
    }
    protected void dvRegister_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            string url = "Default.aspx?ctl=Tu-nghiep-sinhs";
            Response.Redirect(url);
        }
        else if (e.CommandName == "Insert") dvRegister.HeaderText = "Thêm mới";
        else if (e.CommandName == "Edit") dvRegister.HeaderText = "Sửa";
    }

    protected void dvRegister_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        string url = "Default.aspx?ctl=Tu-nghiep-sinhs&mess=Bạn đã thêm mới thành công";

        Response.Redirect(url);
    }

    protected void dvRegister_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Tu-nghiep-sinhs", CMS.TTV.Rules.EDIT))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền thêm mới", this.Page);
            e.Cancel = true;
        }

    }

    protected void dvRegister_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string url = "Default.aspx?ctl=Tu-nghiep-sinhs&mess=Bạn đã sửa thành công";
        Response.Redirect(url);
    }

    protected void dvRegister_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Tu-nghiep-sinhs", CMS.TTV.Rules.APPROVE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền sửa", this.Page);
            e.Cancel = true;
        }
    }

    
    protected void radNgaysinh_Load(object sender, EventArgs e)
    {
        Telerik.WebControls.RadDatePicker radNgaysinh = (Telerik.WebControls.RadDatePicker)sender;
        radNgaysinh.SelectedDate = System.DateTime.Now;
    }
}
