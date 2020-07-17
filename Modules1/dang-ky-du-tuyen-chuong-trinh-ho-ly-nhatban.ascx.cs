using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Net;
using System.IO;
using Newtonsoft.Json.Linq;

public partial class Modules_dang_ky_du_tuyen_chuong_trinh_ho_ly_nhatban : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Random rnd = new Random();
        int month = rnd.Next(90000);
        TextBox2.Text = month.ToString();
    }
    public bool IsReCaptchValid()
    {
        bool result = false;
        string captchaResponse = Request.Form["g-recaptcha-response"];
        string secretKey = "6LfGl9sUAAAAAPGNVTKCXfAxZGIQ15bNW2M7bcU3";
        string apiUrl = "https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}";
        string requestUri = string.Format(apiUrl, secretKey, captchaResponse);
        WebRequest request = (HttpWebRequest)WebRequest.Create(requestUri);

        using (WebResponse response = request.GetResponse())
        {
            using (StreamReader stream = new StreamReader(response.GetResponseStream()))
            {
                string responseFromServer = stream.ReadToEnd();
                JObject jResponse = JObject.Parse(responseFromServer);
                bool isSuccess = jResponse.Value<bool>("success");
                result = (isSuccess) ? true : false;
            }
        }
        return result;
    }
    protected void btngui_Click(object sender, EventArgs e)
    {
        if (!IsReCaptchValid())
        {
            Page.ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=JavaScript>alert('Xác thực không hợp lệ!');</script>");
            return;
        }
        string ngaythangnamsinh = "";
        ngaythangnamsinh = txtngaysinh.Text + "/" + txtthangsinh.Text + "/" + txtnamsinh.Text;


        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection mySqlConnection;
        mySqlConnection = new SqlConnection(connString);
        mySqlConnection.Open();

        SqlCommand sqlCmd = new SqlCommand("[sp_HoLy_NhatBan_Insert]");
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Clear();
        sqlCmd.Parameters.AddWithValue("@Hoten", txthoten.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Ngaysinh", ngaythangnamsinh).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@CMND", txtCMND.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Gioitinh", cbogioitinh.Value).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Honnhan", cbohonhan.Value).Direction = ParameterDirection.Input;

        sqlCmd.Parameters.AddWithValue("@Hokhau", txthokhau.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Sonhan", txtsonha.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Phuongxa", txtphuongxa.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Quanhuyen", txtquanhuyen.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Thanhpho", txtthanhpho.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Dienthoailienhe", txtdienthoailienhe.Text).Direction = ParameterDirection.Input;

        sqlCmd.Parameters.AddWithValue("@Dienthoailienhe2", txtdienthoailienhe2.Text).Direction = ParameterDirection.Input;


        sqlCmd.Parameters.AddWithValue("@Tinhtranghoc", cbotinhtranghoc.Value).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Namhoc", txtnamhoc.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Xeploai", txtxeploaiTN.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Congviec", txtcongviec.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Noilamviec", txtNoilamviec.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Truonghoc", txtTruonghoc.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Hedaotao", cbodaotao.Value).Direction = ParameterDirection.Input;

        sqlCmd.Parameters.AddWithValue("@Nguoilienhe", txtnguoilienhe.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Quanhe", txtquanhe.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Diachinguoithan", txtdiachinguoithan.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Dienthoainguoithan", txtdienthoainguoithan.Text).Direction = ParameterDirection.Input;

        sqlCmd.Parameters.AddWithValue("@TenTruongDaoTao", txtTenTruongDaoTao.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@ChuyenNganhDaoTao", txtChuyenNganhDaoTao.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@SinhVienNamThu", txtSinhVienNam.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@CongViecHienTai", txtCongViecHienTai.Text).Direction = ParameterDirection.Input;

        sqlCmd.Connection = mySqlConnection;
        sqlCmd.ExecuteNonQuery();
        mySqlConnection.Close();

        Response.Redirect(Newwind.VQS.URL + "/successful.aspx");
    }
}