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

public partial class Admin_Modules_AVote : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("QVotes", CMS.TTV.Rules.ONE))
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
                dvAVote.HeaderText = "Sửa câu trả lời";
            }
        }
    }


    protected void dvAVote_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            string url = "Default.aspx?ctl=AVotes";
            if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
            if (Request.QueryString["pID"] != null) url += "&pID=" + Request.QueryString["pID"];
            Response.Redirect(url);
        }
        else if (e.CommandName == "Insert") dvAVote.HeaderText = "Thêm mới câu trả lời";
        else if (e.CommandName == "Edit") dvAVote.HeaderText = "Sửa câu trả lời";
    }

    protected void dvAVote_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        string url = "Default.aspx?ctl=AVotes&mess=Bạn đã thêm mới thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        if (Request.QueryString["pID"] != null) url += "&pID=" + Request.QueryString["pID"];
        Response.Redirect(url);
    }

    protected void dvAVote_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("QVotes", CMS.TTV.Rules.EDIT))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền thêm mới câu trả lời", this.Page);
            e.Cancel = true;
        }

        int iQVoteID = CMS.Utils.ToInteger(Request.QueryString["pID"]);
        int iMaxOrder = CMS.MsSql.ExecuteScalarToInt("SELECT MAX(C_ORDER) FROM T_AVOTE WHERE FK_QVOTE=" + iQVoteID);
        if (iMaxOrder == -1) iMaxOrder = iMaxOrder + 2;
        else iMaxOrder = iMaxOrder + 1;
        AVoteDataSource.InsertParameters["C_ORDER"].DefaultValue = iMaxOrder + "";
    }

    protected void dvAVote_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string url = "Default.aspx?ctl=AVotes&mess=Bạn đã sửa thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        if (Request.QueryString["pID"] != null) url += "&pID=" + Request.QueryString["pID"];
        Response.Redirect(url);
    }

    protected void dvAVote_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("QVotes", CMS.TTV.Rules.APPROVE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền sửa câu trả lời", this.Page);
            e.Cancel = true;
        }
    }

}
