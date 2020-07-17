using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;
using System.IO;
using System.Collections.Generic;

public partial class Modules_searching_worker : System.Web.UI.UserControl
{
    public string listdata = "";
    DataTable ds = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        string itd = CMS.TTV.Web.Utils.GetStringFromQueryString("itd", "");
        if (itd != "")
        {
            BindNganhnghe();
            string ndt = CMS.TTV.Web.Utils.GetStringFromQueryString("ndt", "");
            if (ndt != "")
            {
                BindData(CMS.TTV.Web.Utils.GetStringFromQueryString("ndt", ""), CMS.TTV.Web.Utils.GetStringFromQueryString("th", ""), CMS.TTV.Web.Utils.GetStringFromQueryString("luong", ""), CMS.TTV.Web.Utils.GetStringFromQueryString("gt", ""), CMS.TTV.Web.Utils.GetStringFromQueryString("qq", ""), CMS.TTV.Web.Utils.GetIntFromQueryString("nam", 0));
                cboNganhngheduocdaotao.SelectedValue = CMS.TTV.Web.Utils.GetStringFromQueryString("ndt", "");
            }
            cboChungchi.Value = CMS.TTV.Web.Utils.GetStringFromQueryString("th", "");
            choMucluongmongmuon.Value = CMS.TTV.Web.Utils.GetStringFromQueryString("luong", "");
            rblGioitinh.SelectedValue = CMS.TTV.Web.Utils.GetStringFromQueryString("gt", "");
            cboTinh.Value = CMS.TTV.Web.Utils.GetStringFromQueryString("qq", "");
            cboNamlamviec.Value = CMS.TTV.Web.Utils.GetStringFromQueryString("nam", "");
        }
    }

    public void BindData(string ndt, string th,string luong,string gt, string qq,int nam)
    {
        string sql = "select  C_HODEM, C_TEN, C_NGAYSINH, C_GIOITINH, C_CMND, C_NOICUTRU, C_HUYEN, C_TINH, C_CHUONGTRINH, C_SOID, C_NGAYXUATCANH, C_NGAYVENUOC, "
                     + "  C_NGOAINGU, C_CHUNGCHI, C_DAOTAONGHE1, C_DAOTAOTU1, C_DAOTAODEN1, C_BANGCAP1, C_BANGCAPKHAC1, C_NGHELAMVIEC1, "
                     + " C_CVCUTHE1, C_CVCUTHETU1, C_CVCUTHEDEN1, C_DAOTAONGHE2, C_DAOTAOTU2, C_DAOTAODEN2, C_BANGCAP2, C_BANGCAPKHAC2, C_NGHELAMVIEC2,  "
                     + " C_CVCUTHE2, C_CVCUTHETU2, C_CVCUTHEDEN2, C_DAOTAONGHE3, C_DAOTAOTU3, C_DAOTAODEN3, C_BANGCAP3, C_BANGCAPKHAC3, C_NGHELAMVIEC3, "
                     + " C_CVCUTHE3, C_CVCUTHETU3, C_CVCUTHEDEN3, C_NGANHNGHEDUKIENTIM, C_VITRIMONGMUON, C_MUCLUONGMONGMUON, C_DIADIEMMONGMUON, "
                     + " C_MATIMVIEC,DATEDIFF(month,C_CVCUTHETU1,C_CVCUTHEDEN1)/12 as Kinhnghiem from T_NGUOILAODONG where 1=1";
        if (ndt != "0") sql += " and (C_DAOTAONGHE1 ='" + ndt + "' or C_DAOTAONGHE2 ='" + ndt + "' or C_DAOTAONGHE3 ='" + ndt + "')";
        if (th != "0") sql += " and C_CHUNGCHI LIKE N'"+ th +"'  ";
        if (luong != "0") sql += " and C_MUCLUONGMONGMUON LIKE N'"+luong+"'";
        if (gt != "0") sql += " and C_GIOITINH='" +gt+ "'";
        if (qq != "0") sql += " and C_TINH LIKE N'"+ qq +"'";
        if (nam > 0) sql += " and DATEDIFF(month,C_CVCUTHETU1,C_CVCUTHEDEN1)/12 = " + nam;
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        ds = CMS.MsSql.FillDataTable(sql);



        if (dtNews.Rows.Count > 0)
        {
            for (int i = 0; i < dtNews.Rows.Count; i++)
            {
                int stt = i + 1;
                listdata += " <tr> <td style=\"background:#fff\">" + stt + "</td> "
                  + "<td style=\"background:#fff\">" + dtNews.Rows[i]["C_HODEM"].ToString() + " " + dtNews.Rows[i]["C_TEN"].ToString() + "</td>"
                  + "<td style=\"background:#fff\">" + String.Format("{0:dd/MM/yyyy}", DateTime.Parse(dtNews.Rows[i]["C_NGAYSINH"].ToString())) + "</td> "
                  + "<td style=\"background:#fff\">" + getSex(dtNews.Rows[i]["C_GIOITINH"].ToString()) + "</td> "
                  + "<td style=\"background:#fff\">" + dtNews.Rows[i]["C_MATIMVIEC"].ToString() + "</td> "
                  + "<td style=\"background:#fff\"><a href=\"" + Newwind.VQS.URL + "/thong-tin-nld.aspx?itv=" + dtNews.Rows[i]["C_MATIMVIEC"].ToString() + "\">Xem hồ sơ</a></td>  </tr>";
                 
            }
        }

    }

    string getSex(string gt)
    {
        if (gt == "1") return "Nam";
        else return "Nữ";
    }

    public void BindNganhnghe()
    {
        string sql = "SELECT * from T_DM_NGHE ORDER BY C_MA";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            cboNganhngheduocdaotao.DataSource = dtNews;
            cboNganhngheduocdaotao.DataTextField = "C_NGHE_KR";
            cboNganhngheduocdaotao.DataValueField = "C_MA";
            cboNganhngheduocdaotao.DataBind();
            cboNganhngheduocdaotao.Items.Insert(0, "--- --- ---");

        }
    }
    protected void btntimkiem_Click(object sender, EventArgs e)
    {
        
        Response.Redirect(Newwind.VQS.URL + "/searching-worker.aspx?itd=" + CMS.TTV.Web.Utils.GetStringFromQueryString("itd", "") + "&ndt=" + cboNganhngheduocdaotao.SelectedValue + "&th=" + cboChungchi.Value + "&luong=" + choMucluongmongmuon.Value + "&gt=" + rblGioitinh.SelectedValue + "&qq=" + cboTinh.Value + "&nam="+ cboNamlamviec.Value+"");
        
    }
    protected void cboNganhngheduocdaotao_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/searching-worker.aspx?itd=" + CMS.TTV.Web.Utils.GetStringFromQueryString("itd", "") + "&ndt=" + cboNganhngheduocdaotao.SelectedValue + "");
    }
    protected void btnChon_Click(object sender, EventArgs e)
    {
        ExportToExcel( "danh-sach-ung-vien.xls",ds);
    }

    public void ExportToExcel(string fileName, DataTable dt)
    {
        Response.ContentType = "application/csv";
        Response.Charset = "";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
        Response.ContentEncoding = Encoding.Unicode;
        Response.BinaryWrite(Encoding.Unicode.GetPreamble());
        DataTable dtb = dt;
        try
        {
            StringBuilder sb = new StringBuilder();
            //Tạo dòng tiêu để cho bảng tính
            for (int count = 0; count < dtb.Columns.Count; count++)
            {
                if (dtb.Columns[count].ColumnName != null)
                    sb.Append(dtb.Columns[count].ColumnName);
                if (count < dtb.Columns.Count - 1)
                {
                    sb.Append("\t");
                }
            }
            Response.Write(sb.ToString() + "\n");
            Response.Flush();
            //Duyệt từng bản ghi 
            int soDem = 0;
            while (dtb.Rows.Count >= soDem + 1)
            {
                sb = new StringBuilder();

                for (int col = 0; col < dtb.Columns.Count - 1; col++)
                {
                    if (dtb.Rows[soDem][col] != null)
                        sb.Append(dtb.Rows[soDem][col].ToString().Replace(",", " "));
                    sb.Append("\t");
                }
                if (dtb.Rows[soDem][dtb.Columns.Count - 1] != null)
                    sb.Append(dtb.Rows[soDem][dtb.Columns.Count - 1].ToString().Replace(",", " "));

                Response.Write(sb.ToString() + "\n");
                Response.Flush();
                soDem = soDem + 1;
            }

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

        dtb.Dispose();

        Response.End();
    }



}