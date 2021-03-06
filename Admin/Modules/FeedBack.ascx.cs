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

public partial class Admin_Modules_FeedBack : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("FeedBacks", CMS.TTV.Rules.VIEW))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền xem thông tin liên hệ", this.Page);
            CMS.Utility.HtmlHelper.Back(-1, this.Page);
            return;
        }

        int iFeedBackID = CMS.Utils.ToInteger(Request.QueryString["fID"]);
        if (iFeedBackID > 0)
        {
            CMS.TTV.FeedBack.UpdateFeedBackUser(iFeedBackID);
        }
    }

    protected void dvFeedBack_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            string url = "Default.aspx?ctl=FeedBacks";
            if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
            Response.Redirect(url);
        }
    }
}
