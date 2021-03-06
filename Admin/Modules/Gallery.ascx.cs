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

public partial class Admin_Modules_Gallery : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Gallerys", CMS.TTV.Rules.ONE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền truy cập phần này", this.Page);
            CMS.Utility.HtmlHelper.Back(-1, this.Page);
            return;
        }

        if (!Page.IsPostBack)
        {
            if (Request.QueryString["aID"] != null)
            {
                dvGallery.ChangeMode(DetailsViewMode.Edit);
                dvGallery.HeaderText = "Sửa thư viện ảnh";
            }
        }
    }

    protected void ddlMenus_SelectedIndexChanged(object sender, EventArgs e)
    {
        CMS.Web.Controls.DropDownList ddlMenus = (CMS.Web.Controls.DropDownList)sender;
        ddlMenus.CValue = CMS.Utils.ToInteger(ddlMenus.SelectedValue);
    }

    protected void dvGallery_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            string url = "Default.aspx?ctl=Gallerys";
            if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
            if (Request.QueryString["PageSize"] != null) url += "&PageSize=" + Request.QueryString["PageSize"];
            if (Request.QueryString["MenuID"] != null) url += "&MenuID=" + Request.QueryString["MenuID"];
            Response.Redirect(url);
        }
        else if (e.CommandName == "Insert") dvGallery.HeaderText = "Thêm mới thư viện ảnh";
        else if (e.CommandName == "Edit") dvGallery.HeaderText = "Sửa thư viện ảnh";
    }

    protected void dvGallery_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        string url = "Default.aspx?ctl=Gallerys&mess=Bạn đã thêm mới thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        if (Request.QueryString["PageSize"] != null) url += "&PageSize=" + Request.QueryString["PageSize"];
        if (Request.QueryString["MenuID"] != null) url += "&MenuID=" + Request.QueryString["MenuID"];
        Response.Redirect(url);
    }

    protected void dvGallery_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Gallerys", CMS.TTV.Rules.EDIT))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền thêm mới thư viện ảnh", this.Page);
            e.Cancel = true;
        }

        int iMenuID = CMS.Utils.ToInteger(e.Values["FK_MENU"]);
        int iMaxOrder = CMS.MsSql.ExecuteScalarToInt("SELECT MAX(C_ORDER) FROM T_GALLERY WHERE FK_MENU=" + iMenuID);
        if (iMaxOrder == -1) iMaxOrder = iMaxOrder + 2;
        else iMaxOrder = iMaxOrder + 1;
        GalleryDataSource.InsertParameters["C_ORDER"].DefaultValue = iMaxOrder + "";
    }

    protected void dvGallery_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string url = "Default.aspx?ctl=Gallerys&mess=Bạn đã sửa thành công";
        if (Request.QueryString["Page"] != null) url += "&Page=" + Request.QueryString["Page"];
        if (Request.QueryString["PageSize"] != null) url += "&PageSize=" + Request.QueryString["PageSize"];
        if (Request.QueryString["MenuID"] != null) url += "&MenuID=" + Request.QueryString["MenuID"];
        Response.Redirect(url);
    }

    protected void dvGallery_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("Gallerys", CMS.TTV.Rules.APPROVE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền sửa thư viện ảnh", this.Page);
            e.Cancel = true;
        }

        if (e.NewValues["FK_MENU"].ToString() != e.OldValues["FK_MENU"].ToString())
        {
            int iMenuID = CMS.Utils.ToInteger(e.NewValues["FK_MENU"]);
            int iMaxOrder = CMS.MsSql.ExecuteScalarToInt("SELECT MAX(C_ORDER) FROM T_GALLERY WHERE FK_MENU=" + iMenuID);
            if (iMaxOrder == -1) iMaxOrder = iMaxOrder + 2;
            else iMaxOrder = iMaxOrder + 1;
            GalleryDataSource.UpdateParameters["C_ORDER"].DefaultValue = iMaxOrder + "";
        }
    }

    protected void dvGallery_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (dvGallery.CurrentMode == DetailsViewMode.Insert)
            {
                CMS.Web.Controls.DropDownList ddlMenus = dvGallery.FindControl("ddlMenus") as CMS.Web.Controls.DropDownList;
                int iMenuID = CMS.Utils.ToInteger(Request.QueryString["MenuID"]);
                try
                {
                    ddlMenus.CValue = iMenuID;
                }
                catch { }
            }
        }
    }
}
