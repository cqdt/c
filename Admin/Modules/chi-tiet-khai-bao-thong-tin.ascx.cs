using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Modules_chi_tiet_khai_bao_thong_tin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("chi_tiet_khai_bao_thong_tin", CMS.TTV.Rules.ONE))
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
                dvGallery.HeaderText = "Sửa khai báo";
            }
        }
    }


    protected void dvGallery_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            string url = "Default.aspx?ctl=ds-khai-bao-thong-tin";           
            Response.Redirect(url);
        }
        else if (e.CommandName == "Insert") dvGallery.HeaderText = "Thêm mới khai báo";
        else if (e.CommandName == "Edit") dvGallery.HeaderText = "Sửa khai báo";
    }

    protected void dvGallery_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        string url = "Default.aspx?ctl=ds-khai-bao-thong-tin&mess=Bạn đã thêm mới thành công";
        Response.Redirect(url);
    }

    protected void dvGallery_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("ds-khai-bao-thong-tin", CMS.TTV.Rules.EDIT))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền thêm mới", this.Page);
            e.Cancel = true;
        }
             
    }

    protected void dvGallery_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string url = "Default.aspx?ctl=ds-khai-bao-thong-tin&mess=Bạn đã sửa thành công";       
        Response.Redirect(url);
    }

    protected void dvGallery_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        if (!CMS.TTV.Rule.IsModuleRule("ds-khai-bao-thong-tin", CMS.TTV.Rules.APPROVE))
        {
            CMS.Utility.HtmlHelper.Alert("Bạn không có quyền sửa", this.Page);
            e.Cancel = true;
        }
              
    }












}