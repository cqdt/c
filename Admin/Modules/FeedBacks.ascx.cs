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

public partial class Admin_Modules_FeedBacks : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FeedBacksDataSource.SelectParameters["FK_USER"].DefaultValue = CMS.TTV.Rule.UserID + "";
        if (!Page.IsPostBack)
        {
            int iPage = CMS.Utils.ToInteger(Request.QueryString["Page"]);
            if (iPage > 0) gvFeedBacks.PageIndex = iPage;
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string[] arrID = Request.Form.GetValues("chkFeedBacks");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("FeedBacks", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền xóa";
                return;
            }
            CMS.TTV.FeedBack.DeleteListFeedBack(strIDs);
            gvFeedBacks.DataBind();
            lblAlert.Text = "Đã xóa thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn cần xóa";
    }
}
