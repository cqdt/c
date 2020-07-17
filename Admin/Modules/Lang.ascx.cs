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

public partial class Admin_Modules_Lang : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsLogin())
        {
            Response.Redirect("Login.aspx");
            return;
        }
    }

    protected void dvLocalization_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        CMS.Utility.HtmlHelper.Alert("Đã thêm " + e.Values["ResourceKey"].ToString().Replace("'", "''"), this.Page);
    }

    protected void gvLocalization_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        CMS.Utility.HtmlHelper.Alert("Đã xóa xong", this.Page);
    }

    protected void gvLocalization_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState == DataControlRowState.Normal)
        {
            ImageButton btnXoa = e.Row.Cells[1].Controls[0] as ImageButton;
            btnXoa.OnClientClick = "if (confirm('Bạn chắc là mình muốn xóa chứ !') == false) return false;";
        }
    }

    protected void gvLocalization_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        CMS.Utility.HtmlHelper.Alert("Đã sửa " + e.OldValues["ResourceKey"].ToString().Replace("'", "''"), this.Page);
    }

    protected void ddlLang_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ListItem item = new ListItem("Tất cả", "-1");
            ddlLang.Items.Insert(0, item);
        }
    }

    protected void dvLocalization_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        string ResourceKey = e.Values["ResourceKey"].ToString();
        string LocaleID = e.Values["LocaleID"].ToString();
        string VirtualPath = e.Values["VirtualPath"].ToString();
        int i = CMS.MsSql.ExecuteScalarToInt("SELECT COUNT(ResourceID) FROM T_ResourceString WHERE ResourceKey='" + ResourceKey + "' AND LocaleID='" + LocaleID + "' AND VirtualPath='" + VirtualPath + "'");
        if (i >= 1)
        {
            CMS.Utility.HtmlHelper.Alert("Đã tồn tại vui lòng kiểm tra lại", this.Page);
            e.Cancel = true;
        }
    }
}
