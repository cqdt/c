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

public partial class Admin_Modules_detail_vi_tri : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("dm-vi-tri", CMS.TTV.Rules.ONE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền truy cập phần này", this.Page);
            CMS.Utility.HtmlHelper.Back(-1, this.Page);
            return;
        }

        if (!Page.IsPostBack)
        {
            if (Request.QueryString["fID"] != null)
            {
                dvAVote.ChangeMode(DetailsViewMode.Edit);
                dvAVote.HeaderText = "Sửa";
            }
        }
    }

    protected void dvAVote_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            string url = "Default.aspx?ctl=dm-vi-tri";
            if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];

            Response.Redirect(url);
        }
        else if (e.CommandName == "Insert") dvAVote.HeaderText = "Thêm mới";
        else if (e.CommandName == "Edit") dvAVote.HeaderText = "Sửa";
    }

    protected void dvAVote_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        string url = "Default.aspx?ctl=dm-nganh-nghe&mess=Bạn đã thêm mới thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        Response.Redirect(url);
    }

    protected void dvAVote_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("dm-vi-tri", CMS.TTV.Rules.EDIT))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền thêm mới", this.Page);
            e.Cancel = true;
        }
    }

    protected void dvAVote_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string url = "Default.aspx?ctl=dm-vi-tri&mess=Bạn đã sửa thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        Response.Redirect(url);
    }

    protected void dvAVote_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("dm-vi-tri", CMS.TTV.Rules.APPROVE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền sửa", this.Page);
            e.Cancel = true;
        }
    }



}