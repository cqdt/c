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

public partial class Admin_Modules_Gallerys : System.Web.UI.UserControl
{
    public string HighLight(object _obj)
    {
        if (CMS.Utils.ToInteger(_obj) == 1)
        {
            return "<br><span class=\"HighLight\">(Ảnh nổi bật)</span>";
        }
        else return "";
    }

    private void SetGallerys(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkGallerys");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("Gallerys", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
                return;
            }
            string strSql = sql + " WHERE PK_GALLERY IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvGallerys.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn thư viện ảnh liệu cần " + mess;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request["mess"] != null)
            {
                lblAlert.Text = Request.QueryString["mess"];
            }

            int iPageSize = CMS.Utils.ToInteger(Request.QueryString["PageSize"]);
            int iPage = CMS.Utils.ToInteger(Request.QueryString["Page"]);
            if (iPageSize == 5 || iPageSize == 10 || iPageSize == 20 || iPageSize == 50 || iPageSize == 100)
            {
                ddlPageSize.SelectedValue = iPageSize + "";
                gvGallerys.PageSize = iPageSize;
            }
            if (iPage > 0) gvGallerys.PageIndex = iPage;

            int iMenuID = CMS.Utils.ToInteger(Request.QueryString["MenuID"]);
            if (iMenuID > 0)
            {
                try
                {
                    ddlMenu.LangValue = 1;
                    ddlMenu.CValue = iMenuID;
                }
                catch { }
            }

            int iOrder = CMS.Utils.ToInteger(Request.QueryString["udID"]);
            if (iOrder > 0)
            {
                if (CMS.TTV.Rule.IsModuleRule("Gallerys", CMS.TTV.Rules.APPROVE))
                {
                    int iGalleryID = CMS.Utils.ToInteger(Request.QueryString["fID"]);
                    DataTable dtGallerys = CMS.MsSql.FillDataTable("SELECT PK_GALLERY,C_ORDER FROM T_GALLERY WHERE (FK_MENU=(SELECT FK_MENU FROM T_GALLERY WHERE PK_GALLERY=" + iGalleryID + ") AND C_ORDER=" + iOrder + ") OR PK_GALLERY=" + iGalleryID );
                    DataRow[] dr;
                    int iGalleryOrderID = 0;
                    int iGalleryIDOrder = 0;
                    dr = dtGallerys.Select("C_ORDER = " + iOrder);
                    if (dr.Length > 0) iGalleryOrderID = CMS.Utils.ToInteger(dr[0]["PK_GALLERY"]);
                    dr = dtGallerys.Select("PK_GALLERY = " + iGalleryID);
                    if (dr.Length > 0) iGalleryIDOrder = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
                    string sql = "UPDATE T_GALLERY SET C_ORDER=" + iOrder + " WHERE PK_GALLERY=" + iGalleryID;
                    sql += "; UPDATE T_GALLERY SET C_ORDER=" + iGalleryIDOrder + " WHERE PK_GALLERY=" + iGalleryOrderID;
                    //Response.Write(sql);
                    CMS.MsSql.ExecuteNonQuery(sql);
                }
                else
                {
                    lblAlert.Text = "Bạn không có quyền di chuyển";
                }
            }


        }
    }

    protected void ddlMenu_SelectedIndexChanged(object sender, EventArgs e)
    {
        int iMenuID = CMS.Utils.ToInteger(ddlMenu.SelectedValue);
        ddlMenu.CValue = iMenuID;
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        string url = "Default.aspx?ctl=Gallery";
        if (gvGallerys.PageIndex > 0) url += "&Page=" + gvGallerys.PageIndex;
        url += "&PageSize=" + ddlPageSize.SelectedValue;
        url += "&MenuID=" + ddlMenu.SelectedValue;
        Response.Redirect(url);
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetGallerys("DELETE FROM T_GALLERY", "xóa");
    }

    protected void btnSetHighLight_Click(object sender, EventArgs e)
    {
        SetGallerys("UPDATE T_GALLERY SET C_HOT=1,C_MODIFY_DATE=GETDATE()", "phân loại");
    }

    protected void btnUnSetHighLight_Click(object sender, EventArgs e)
    {
        SetGallerys("UPDATE T_GALLERY SET C_HOT=0", "bỏ phân loại");
    }

    protected void btnSetStatus_Click(object sender, EventArgs e)
    {
        SetGallerys("UPDATE T_GALLERY SET C_STATUS=1", "hiển thị");
    }

    protected void btnUnSetStatus_Click(object sender, EventArgs e)
    {
        SetGallerys("UPDATE T_GALLERY SET C_STATUS=0", "bỏ hiển thị");
    }

    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvGallerys.PageSize = CMS.Utils.ToInteger(ddlPageSize.SelectedValue);
    }

    string getURL()
    {
        string url = "";
        if (gvGallerys.PageIndex > 0) url += "&Page=" + gvGallerys.PageIndex;
        url += "&PageSize=" + ddlPageSize.SelectedValue;
        url += "&MenuID=" + ddlMenu.SelectedValue;
        return url;
    }

    protected void gvGallerys_PreRender(object sender, EventArgs e)
    {
        int iMenuID = CMS.Utils.ToInteger(ddlMenu.SelectedValue);
        int iStatus = CMS.Utils.ToInteger(ddlStatus.SelectedValue);
        string strName = txtTitle.Text;
        if (iMenuID > 2 && iStatus == -1 && strName == "")
        {
            DataTable dtGallerys = CMS.MsSql.FillDataTable("SELECT PK_GALLERY,C_ORDER FROM T_GALLERY WHERE FK_MENU=" + iMenuID);
            DataRow[] dr;
            int iGalleryID = 0;
            int iUp = 0;
            int iDown = 0;
            int iOrder = 0;
            for (int i = 0; i < gvGallerys.Rows.Count; i++)
            {
                iGalleryID = CMS.Utils.ToInteger(gvGallerys.DataKeys[i].Value);
                dr = dtGallerys.Select("PK_GALLERY = " + iGalleryID);
                if (dr.Length > 0) iOrder = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
                dr = dtGallerys.Select("C_ORDER > " + iOrder);
                if (dr.Length > 0) iDown = CMS.Utils.ToInteger(dr[0]["C_ORDER"]);
                dr = dtGallerys.Select("C_ORDER < " + iOrder);
                if (dr.Length > 0) iUp = CMS.Utils.ToInteger(dr[dr.Length - 1]["C_ORDER"]);
                if (i == 0 && gvGallerys.PageIndex == 0)
                {
                    if (gvGallerys.Rows.Count > 1) gvGallerys.Rows[0].Cells[1].Text = "<a href='Default.aspx?ctl=Gallerys&fID=" + iGalleryID + "&udID=" + iDown + getURL() + "'><img src='Images/down.gif' border='0' /></a>";
                    // else gvGallerys.Columns.RemoveAt(1);
                }
                else if ((i == gvGallerys.Rows.Count - 1 && i != 0 && gvGallerys.PageIndex == gvGallerys.PageCount - 1) || (i == 0 && gvGallerys.Rows.Count == 1))
                {
                    gvGallerys.Rows[i].Cells[1].Text = "<a href='Default.aspx?ctl=Gallerys&fID=" + iGalleryID + "&udID=" + iUp + getURL() + "'><img src='Images/up.gif' border='0' /></a>";
                }
                else
                {
                    gvGallerys.Rows[i].Cells[1].Text = "<a href='Default.aspx?ctl=Gallerys&fID=" + iGalleryID + "&udID=" + iDown + getURL() + "'><img src='Images/down.gif' border='0' /></a> <a href='Default.aspx?ctl=Gallerys&fID=" + iGalleryID + "&udID=" + iUp + getURL() + "'><img src='Images/up.gif' border='0' /></a>";
                }
            }
        }
    }
}
