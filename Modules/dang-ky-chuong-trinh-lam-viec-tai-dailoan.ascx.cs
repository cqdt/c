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
public partial class Modules_dang_ky_chuong_trinh_lam_viec_tai_dailoan : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
        try
        {
            string ngaythangnamsinh = "";
            ngaythangnamsinh = txtngaysinh.Text + "/" + txtthangsinh.Text + "/" + txtnamsinh.Text;


            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection mySqlConnection;
            mySqlConnection = new SqlConnection(connString);
            mySqlConnection.Open();

            SqlCommand sqlCmd = new SqlCommand("[sp_LV_DaiLoan_Insert]");
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Clear();
            sqlCmd.Parameters.AddWithValue("@Hoten", txthoten.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Ngaysinh", ngaythangnamsinh).Direction = ParameterDirection.Input;

            sqlCmd.Parameters.AddWithValue("@Trinhdotiengtrung", cbotrinhdotiengtrung.Value).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Dalamviectaidailoan", cbodalamviectaidailoan.Value).Direction = ParameterDirection.Input;

            sqlCmd.Parameters.AddWithValue("@CMND", txtCMND.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Trinhdo", txttrinhdo.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Honnhan", cbohonhan.Value).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Hokhau", txthokhau.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Sonhan", txtsonha.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Phuongxa", txtphuongxa.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Quanhuyen", txtquanhuyen.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Thanhpho", txtthanhpho.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Dienthoai1", txtdienthoai1.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Dienthoai2", txtdienthoai2.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Nguoilienhe", txtnguoilienhe.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Quanhe", txtquanhe.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Diachi", txtdiachi.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Dienthoai", txtdienthoai.Text).Direction = ParameterDirection.Input;

            sqlCmd.Parameters.AddWithValue("@GioiTinh", slGioiTinh.Value).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@ChieuCao", txtChieuCao.Text).Direction = ParameterDirection.Input;

            sqlCmd.Connection = mySqlConnection;
            int a = sqlCmd.ExecuteNonQuery();
            lblmes.Text = a.ToString();
            mySqlConnection.Close();
        }catch(Exception exx)
        {
            lblmes.Text = exx.Message;
            txtChieuCao.Text = exx.Message;
        }
        Response.Redirect(Newwind.VQS.URL + "/successful.aspx");
    }
}