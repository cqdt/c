using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Modules_nld_sua_thong_tin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        txtMaTV.Attributes.Add("autocomplete", "off");
        txthochieu.Attributes.Add("autocomplete", "off");
        txtteldadk.Attributes.Add("autocomplete", "off");

        string itv = CMS.TTV.Web.Utils.GetStringFromQueryString("itv", "");
        if (itv != "")
        {
            Binddata(itv);
            DisableTxT();
            btnEditinfo.Enabled = true;
            btnFinish.Enabled = false;
            txtMaTV.Text = itv;
        }
        else
        {
            thongtinnld.Visible = false;            
        }

        string cmnd = CMS.TTV.Web.Utils.GetStringFromQueryString("cmnd", "");
        string tel = CMS.TTV.Web.Utils.GetStringFromQueryString("tel", "");

        if ((tel != "") && (cmnd != ""))
        {
            Binddata2(tel, cmnd);
            DisableTxT();
            thongtinnld.Visible = true;
            txthochieu.Text = cmnd;
            txtteldadk.Text = tel;

        }


    }


    protected void btndangnhap_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/nld-sua-thong-tin.aspx?itv=" + txtMaTV.Text + "");
    }
    protected void btnTimkiem_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/nld-sua-thong-tin.aspx?tel=" + txtteldadk.Text + "&cmnd=" + txthochieu.Text + "");
    }

    public void Binddata2(string tel, string cmnd)
    {
        string sql = "select * from T_NGUOILAODONG where C_CMND='" + cmnd + "' and C_DIENTHOAI='"+tel+"'";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            txthodem.Text = dtNews.Rows[0]["C_HODEM"].ToString();
            txtten.Text = dtNews.Rows[0]["C_TEN"].ToString();
            dpngaysinh.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_NGAYSINH"].ToString());
            cboGioitinh.Value = dtNews.Rows[0]["C_GIOITINH"].ToString();
            txtCMND.Text = dtNews.Rows[0]["C_CMND"].ToString();
            txtDiachi.Text = dtNews.Rows[0]["C_NOICUTRU"].ToString();

            txtHuyen.Text = dtNews.Rows[0]["C_HUYEN"].ToString();
            cboTinh.Value = dtNews.Rows[0]["C_TINH"].ToString();
            cboChuongtrinhthamgia.Value = dtNews.Rows[0]["C_CHUONGTRINH"].ToString();
            txtIDnuocngoai.Text = dtNews.Rows[0]["C_SOID"].ToString();
            dpNgayxuatcanh.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_NGAYXUATCANH"].ToString());

            dpNgayvenuoc.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_NGAYVENUOC"].ToString());
            txtDienthoai.Text = dtNews.Rows[0]["C_DIENTHOAI"].ToString();
            txtEmail.Text = dtNews.Rows[0]["C_EMAIL"].ToString();
            txtMaTV.Text = dtNews.Rows[0]["C_MATIMVIEC"].ToString();
        }
    }


    public void Binddata(string itv)
    {
        string sql = "select * from T_NGUOILAODONG where C_MATIMVIEC='" + itv + "'";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            txthodem.Text = dtNews.Rows[0]["C_HODEM"].ToString();
            txtten.Text = dtNews.Rows[0]["C_TEN"].ToString();
            dpngaysinh.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_NGAYSINH"].ToString());
            cboGioitinh.Value = dtNews.Rows[0]["C_GIOITINH"].ToString();
            txtCMND.Text = dtNews.Rows[0]["C_CMND"].ToString();
            txtDiachi.Text = dtNews.Rows[0]["C_NOICUTRU"].ToString();

            txtHuyen.Text = dtNews.Rows[0]["C_HUYEN"].ToString();
            cboTinh.Value = dtNews.Rows[0]["C_TINH"].ToString();
            cboChuongtrinhthamgia.Value = dtNews.Rows[0]["C_CHUONGTRINH"].ToString();
            txtIDnuocngoai.Text = dtNews.Rows[0]["C_SOID"].ToString();
            dpNgayxuatcanh.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_NGAYXUATCANH"].ToString());

            dpNgayvenuoc.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_NGAYVENUOC"].ToString());
            txtDienthoai.Text = dtNews.Rows[0]["C_DIENTHOAI"].ToString();
            txtEmail.Text = dtNews.Rows[0]["C_EMAIL"].ToString();
           
            

        }
    }

    public void DisableTxT()
    {
        txthodem.Enabled = false;
        txtten.Enabled = false;
        dpngaysinh.Enabled = false;
        cboGioitinh.Disabled = true;
        txtCMND.Enabled = false;
        txtDiachi.Enabled = false;

        txtHuyen.Enabled = false;
        cboTinh.Disabled = true;
        cboChuongtrinhthamgia.Disabled = true;
        txtIDnuocngoai.Enabled = false;
        dpNgayxuatcanh.Enabled = false;

        dpNgayvenuoc.Enabled = false;
        txtDienthoai.Enabled = false;
        txtEmail.Enabled = false;
    }

    public void EnableTxT()
    {
        txthodem.Enabled = true;
        txtten.Enabled = true;
        dpngaysinh.Enabled = true;
        cboGioitinh.Disabled = false;
        txtCMND.Enabled = true;
        txtDiachi.Enabled = true;

        txtHuyen.Enabled = true;
        cboTinh.Disabled = false;
        cboChuongtrinhthamgia.Disabled = false;
        txtIDnuocngoai.Enabled = true;
        dpNgayxuatcanh.Enabled = true;

        dpNgayvenuoc.Enabled = true;
        txtDienthoai.Enabled = true;
        txtEmail.Enabled = true;
    }

    protected void btnFinish_Click(object sender, EventArgs e)
    {
        try
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection mySqlConnection;
            mySqlConnection = new SqlConnection(connString);
            mySqlConnection.Open();
            SqlCommand sqlCmd = new SqlCommand("[sp_NLD_dangky_KR_Edit]");
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Clear();
            sqlCmd.Parameters.AddWithValue("@C_HODEM", txthodem.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_TEN", txtten.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_NGAYSINH", dpngaysinh.SelectedDate).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_GIOITINH", cboGioitinh.Value).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_CMND", txtCMND.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_NOICUTRU", txtDiachi.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_HUYEN", txtHuyen.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_TINH", cboTinh.Value).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_CHUONGTRINH", cboChuongtrinhthamgia.Value).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_SOID", txtIDnuocngoai.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_NGAYXUATCANH", dpNgayxuatcanh.SelectedDate).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_NGAYVENUOC", dpNgayvenuoc.SelectedDate).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_DIENTHOAI", txtDienthoai.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_EMAIL", txtEmail.Text).Direction = ParameterDirection.Input;

            sqlCmd.Parameters.AddWithValue("@C_MATIMVIEC", CMS.TTV.Web.Utils.GetStringFromQueryString("itv", "")).Direction = ParameterDirection.Input;

            sqlCmd.Connection = mySqlConnection;
            sqlCmd.ExecuteNonQuery();
            mySqlConnection.Close();

        }
        catch
        {
            CMS.Utility.HtmlHelper.Alert("Có lỗi xảy ra trong quá trình thao tác !", this.Page);
        }
        Response.Redirect(Newwind.VQS.URL + "/nld-sua-thong-tin.aspx?itv=" + CMS.TTV.Web.Utils.GetStringFromQueryString("itv", "") + "");
    }
   
}