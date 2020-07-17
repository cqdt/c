using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Modules_phien_giao_dich_viec_lam : System.Web.UI.UserControl
{
    public string listdata = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindVitri();
            BindNganhnghe();
        }
        string itv = CMS.TTV.Web.Utils.GetStringFromQueryString("itv", "");
        if (itv != "")
        {

            if (CMS.TTV.Web.Utils.GetStringFromQueryString("ndt", "")!="") cboNganhngheduocdaotao.SelectedValue = CMS.TTV.Web.Utils.GetStringFromQueryString("ndt", "");
            if (CMS.TTV.Web.Utils.GetStringFromQueryString("vt", "")!="") cbovitri.SelectedValue = CMS.TTV.Web.Utils.GetStringFromQueryString("vt", "");
            if (CMS.TTV.Web.Utils.GetStringFromQueryString("luong", "")!="") choMucluongmongmuon.Value = CMS.TTV.Web.Utils.GetStringFromQueryString("luong", "");
            if (CMS.TTV.Web.Utils.GetStringFromQueryString("qq", "")!="") cboTinh.Value = CMS.TTV.Web.Utils.GetStringFromQueryString("qq", "");
            if (CMS.TTV.Web.Utils.GetStringFromQueryString("cc", "") !="") cboChungchi.Value = CMS.TTV.Web.Utils.GetStringFromQueryString("cc", "");

            string ndt = CMS.TTV.Web.Utils.GetStringFromQueryString("ndt", "");
            if (ndt !="") BindData(CMS.TTV.Web.Utils.GetStringFromQueryString("ndt", ""), CMS.TTV.Web.Utils.GetStringFromQueryString("vt", ""), CMS.TTV.Web.Utils.GetStringFromQueryString("luong", ""), CMS.TTV.Web.Utils.GetStringFromQueryString("qq", ""), CMS.TTV.Web.Utils.GetStringFromQueryString("cc", ""));
            
        }
    }

    public void BindData(string ndt, string vt, string luong, string qq, string cc)
    {
        string sql = "select T_TUYENDUNG_VIECLAM.*,tkr.C_TENCTY, tkr.C_DIACHICTY,tkr.C_HUYEN,tkr.C_TINH from T_TUYENDUNG_VIECLAM, T_TUYENDUNG_KR tkr where tkr.C_MATUYENDUNG=T_TUYENDUNG_VIECLAM.FK_CTY and T_TUYENDUNG_VIECLAM.C_THOIGIANNHANDEN >= GETDATE()";
        if (ndt != "") sql += " and C_NGHELAMVIEC LIKE N'%" + ndt + "'";
        if (vt != "") sql += " and C_VITRI LIKE N'" + vt + "'  ";
        if (luong != "") sql += " and C_MUCLUONGTOITHIEU LIKE N'" + luong + "'";
        if (cc != "") sql += " and C_KYNANGGIAOTIEPTIENGHAN='" + cc + "'";
        if (qq != "") sql += " and C_TINH LIKE N'" + qq + "'";

        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            for (int i = 0; i < dtNews.Rows.Count; i++)
            {
                int stt = i + 1;

                listdata += " <tr><td style=\"background:#fff;padding-left:5px\">" + stt + "</td> "
                 + "<td style=\"background:#fff;padding-left:5px\">" + dtNews.Rows[i]["C_TENCTY"].ToString() + "</td> "
                 + "<td style=\"background:#fff;padding-left:5px\">" + dtNews.Rows[i]["C_DIACHICTY"].ToString() + " - " + dtNews.Rows[i]["C_HUYEN"].ToString() + " - " + dtNews.Rows[i]["C_TINH"].ToString() + "</td> "
                 + "<td style=\"background:#fff;padding-left:5px\"><a href=\"" + Newwind.VQS.URL + "/business-info.aspx?itd=" + dtNews.Rows[i]["FK_CTY"].ToString() + "&reg=0&vlid=" + dtNews.Rows[i]["ID"].ToString() + "\">" + dtNews.Rows[i]["C_VITRI"].ToString() + "</a></td> "
                 + "<td style=\"background:#fff;padding-left:5px\"><a href=\"" + Newwind.VQS.URL + "/nld-dang-ky-tim-viec.aspx?itv=" + CMS.TTV.Web.Utils.GetStringFromQueryString("itv", "") + "&itd=" + dtNews.Rows[i]["FK_CTY"].ToString() + "&ht=0&vlid=" + dtNews.Rows[i]["ID"].ToString() + "\">Ứng tuyển</a></td></tr>";
                
            }
        }
    }

    public void BindVitri()
    {
        string sql = "SELECT * from T_DM_VITRI ORDER BY C_MAVT";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            cbovitri.DataSource = dtNews;
            cbovitri.DataTextField = "C_VITRI";
            cbovitri.DataValueField = "C_MAVT";
            cbovitri.DataBind();
            cbovitri.Items.Insert(0, "--- --- ---");
        }
    }

    public void BindNganhnghe()
    {
        string sql = "SELECT * from T_DM_NGHE ORDER BY C_MA";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            cboNganhngheduocdaotao.DataSource = dtNews;
            cboNganhngheduocdaotao.DataTextField = "C_NGHE";
            cboNganhngheduocdaotao.DataValueField = "C_MA";
            cboNganhngheduocdaotao.DataBind();
            cboNganhngheduocdaotao.Items.Insert(0, "--- --- ---");

        }
    }
    protected void btntimkiem_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/phien-giao-dich-viec-lam.aspx?itv=" + CMS.TTV.Web.Utils.GetStringFromQueryString("itv", "")  + "&ndt=" + cboNganhngheduocdaotao.SelectedValue + "&vt=" + cbovitri.SelectedValue + "&luong=" + choMucluongmongmuon.Value + "&qq=" + cboTinh.Value + "&cc=" + cboChungchi.Value + ""); 
    }
}