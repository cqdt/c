using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class Modules_business_info : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        string itd = CMS.TTV.Web.Utils.GetStringFromQueryString("itd", "");
        if (itd != "")
        {
            txtMaTD.Text = itd;
            Binddata(itd);

            string vlid = CMS.TTV.Web.Utils.GetStringFromQueryString("vlid", "");
            if (vlid != "")
            {
                BindVieclam(vlid);
                txtnguoilienhe.Text = "";
                txtMaTD.Text = "";
                txtdienthoailienhe.Text = "";
                txtemail.Text = "";
                dkboxung.Visible = false;
                lblDangtuyenSuscess.Text = "Quý công ty đã đăng ký tuyển dụng thành công !";
            }
            
            btndangkyhuy.Enabled = true;
            BindNganhnghe();
            BindVitri();
            string reg = CMS.TTV.Web.Utils.GetStringFromQueryString("reg", "");
            if (reg == "0") btndangkytiep.Enabled = false;
            else btndangkytiep.Enabled = true;
        }
        else
        {
            btndangky.Enabled = false;
            btndangkytiep.Enabled = false;
            btndangkyhuy.Enabled = false;
        }
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
            cboNganhngheduocdaotao.Items.Insert(0, "--- ---- ---");
        }
    }

    public void BindVitri()
    {
        string sql = "SELECT * from T_DM_VITRI ORDER BY C_MAVT";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            cbovitri.DataSource = dtNews;
            cbovitri.DataTextField = "C_VITRI_KR";
            cbovitri.DataValueField = "C_MAVT";
            cbovitri.DataBind();
            cbovitri.Items.Insert(0, "--- --- ---");
            
        }
    }

    public void Binddata(string itd)
    {
        string sql = "select * from T_TUYENDUNG_KR where C_MATUYENDUNG='" + itd + "'";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            txttencongty.Text = dtNews.Rows[0]["C_TENCTY"].ToString();
            txtdiachicongty.Text = dtNews.Rows[0]["C_DIACHICTY"].ToString() + " - " + dtNews.Rows[0]["C_HUYEN"].ToString() + " - " + dtNews.Rows[0]["C_TINH"].ToString();
            txtchucdanh.Text = dtNews.Rows[0]["C_CHUCDANH"].ToString();
            txtemail.Text = dtNews.Rows[0]["C_EMAIL"].ToString();
            txtnguoilienhe.Text = dtNews.Rows[0]["C_NGUOILIENHE"].ToString();
            txtdienthoailienhe.Text = dtNews.Rows[0]["C_DTLIENHE"].ToString();            
        }
    }


    public void BindVieclam(string vlid)
    {
        string sql = "select  * from T_TUYENDUNG_VIECLAM where ID='" + vlid + "' order by ID desc";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            cbovitri.SelectedValue = dtNews.Rows[0]["C_VITRI"].ToString();
            txtmota.Text = dtNews.Rows[0]["C_MOTA"].ToString();
            txtsoluongtuyen.Text = dtNews.Rows[0]["C_SOLUONGTUYEN"].ToString();
            txtkynanggiaotieptienghan.Value = dtNews.Rows[0]["C_KYNANGGIAOTIEPTIENGHAN"].ToString();

            cboNganhngheduocdaotao.SelectedValue = dtNews.Rows[0]["C_NGHELAMVIEC"].ToString();
            cboNamlamviec.Value = dtNews.Rows[0]["C_NAMLAMVIEC"].ToString();
            cboBangcap.Value = dtNews.Rows[0]["C_BANGCAP"].ToString();
            txtbangcapchitiet.Text = dtNews.Rows[0]["C_CHITIETBANGCAP"].ToString();
            txtdotuoitu.Text = dtNews.Rows[0]["C_TUOITU"].ToString();
            txtdotuoiden.Text = dtNews.Rows[0]["C_TUOIDEN"].ToString();

            rblGioitinh.SelectedValue = dtNews.Rows[0]["C_GIOITINH"].ToString();
            txtnoicutru.Value = dtNews.Rows[0]["C_NOICUTRU"].ToString();
            txtmucluongtoithieu.Value = dtNews.Rows[0]["C_MUCLUONGTOITHIEU"].ToString();
            txtthuong.Text = dtNews.Rows[0]["C_THUONG"].ToString();
            rblThuong.Value = dtNews.Rows[0]["C_THANGQUYNAM"].ToString();
            txtchedodaingokhac.Text = dtNews.Rows[0]["C_CHEDOKHAC"].ToString();
            txthosodutuyen.Text = dtNews.Rows[0]["C_HOSO"].ToString();


            txtnhanhosotu.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_THOIGIANNHANTU"].ToString());
            txtnhanhosoden.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_THOIGIANNHANDEN"].ToString());
            txtthoigiantuyen.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_THOIGIANTUYEN"].ToString());
            


            cbovitri.Enabled = false;
            txtmota.Enabled = false;
            txtsoluongtuyen.Enabled = false;
            txtkynanggiaotieptienghan.Disabled = true;

            cboNganhngheduocdaotao.Enabled = false;
            cboNamlamviec.Disabled = true;
            cboBangcap.Disabled = true;
            txtbangcapchitiet.Enabled = false;
            txtbangcapchitiet.Enabled = false;

            txtdotuoitu.Enabled = false;
            txtdotuoiden.Enabled = false;

            rblGioitinh.Enabled = false;
            txtnoicutru.Disabled = true;
            txtmucluongtoithieu.Disabled = true;
            txtthuong.Enabled = false;
            rblThuong.Disabled = true;

            txtchedodaingokhac.Enabled = false;
            txthosodutuyen.Enabled = false;
            txtnhanhosotu.Enabled = false;
            txtnhanhosoden.Enabled = false;
            txtthoigiantuyen.Enabled = false;

            btndangky.Enabled = false;


        }
    }

    public void ContinuesReg()
    {
        cbovitri.Enabled = true;
        txtmota.Enabled = true;
        txtsoluongtuyen.Enabled = true;
        txtkynanggiaotieptienghan.Disabled = false;

        cboNganhngheduocdaotao.Enabled = true;
        cboNamlamviec.Disabled = false;
        cboBangcap.Disabled = false;
        txtbangcapchitiet.Enabled = true;
        txtbangcapchitiet.Enabled = true;

        txtdotuoitu.Enabled = true;
        txtdotuoiden.Enabled = true;

        rblGioitinh.Enabled = true;
        txtnoicutru.Disabled = false;
        txtmucluongtoithieu.Disabled = false;
        txtthuong.Enabled = true;
        rblThuong.Disabled = false;

        txtchedodaingokhac.Enabled = true;
        txthosodutuyen.Enabled = true;
        txtnhanhosotu.Enabled = true;
        txtnhanhosoden.Enabled = true;
        txtthoigiantuyen.Enabled = true;

        btndangky.Enabled = true;
    }

    protected void btndangkytiep_Click(object sender, EventArgs e)
    {
        ContinuesReg();        
        Response.Redirect(Newwind.VQS.URL + "/business-info.aspx?itd=" + txtMaTD.Text + "&reg=1&vlid=0");
        btndangkytiep.Enabled = true;
    }
    protected void btndangkyhuy_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/findworker.aspx");
    }
    protected void btndangky_Click(object sender, EventArgs e)
    {

        string itd = CMS.TTV.Web.Utils.GetStringFromQueryString("itd", "");


        try
        {           
            
            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection mySqlConnection;
            mySqlConnection = new SqlConnection(connString);
            mySqlConnection.Open();
            SqlCommand sqlCmd = new SqlCommand("[sp_Tuyendung_Vieclam_Insert]");
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Clear();
            sqlCmd.Parameters.AddWithValue("@FK_CTY", itd).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_VITRI", cbovitri.SelectedValue).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_MOTA", txtmota.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_SOLUONGTUYEN", txtsoluongtuyen.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_KYNANGGIAOTIEPTIENGHAN", txtkynanggiaotieptienghan.Value).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_NGHELAMVIEC", cboNganhngheduocdaotao.SelectedValue).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_NAMLAMVIEC", cboNamlamviec.Value).Direction = ParameterDirection.Input;

            sqlCmd.Parameters.AddWithValue("@C_BANGCAP", cboBangcap.Value).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_CHITIETBANGCAP", txtbangcapchitiet.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_TUOITU", txtdotuoitu.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_TUOIDEN", txtdotuoiden.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_GIOITINH", rblGioitinh.SelectedValue).Direction = ParameterDirection.Input;

            sqlCmd.Parameters.AddWithValue("@C_NOICUTRU", txtnoicutru.Value).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_MUCLUONGTOITHIEU", txtmucluongtoithieu.Value).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_THUONG", txtthuong.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_THANGQUYNAM", rblThuong.Value).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_CHEDOKHAC", txtchedodaingokhac.Text).Direction = ParameterDirection.Input;

            sqlCmd.Parameters.AddWithValue("@C_HOSO", txthosodutuyen.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_THOIGIANNHANTU", txtnhanhosotu.SelectedDate).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_THOIGIANNHANDEN", txtnhanhosoden.SelectedDate).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_THOIGIANTUYEN", txtthoigiantuyen.SelectedDate).Direction = ParameterDirection.Input; 

            sqlCmd.Connection = mySqlConnection;
            sqlCmd.ExecuteNonQuery();
            mySqlConnection.Close();

        }
        catch
        {
            CMS.Utility.HtmlHelper.Alert("Có lỗi xảy ra trong quá trình thao tác !", this.Page);
        }



        BindVieclam(itd);

        int idvieclam = CMS.SqlCache.ExecuteToInt("select top 1 ID from T_TUYENDUNG_VIECLAM where FK_CTY='" + itd + "' order by id desc");
        btndangky.Enabled = false;
        

        Response.Redirect(Newwind.VQS.URL + "/business-info.aspx?itd=" + txtMaTD.Text + "&reg=1&vlid=" + idvieclam);
        //btndangkytiep.Enabled = false;


    }





}