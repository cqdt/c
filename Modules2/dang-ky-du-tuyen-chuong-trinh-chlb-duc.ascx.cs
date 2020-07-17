using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Modules_dang_ky_du_tuyen_chuong_trinh_chlb_duc : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btngui_Click(object sender, EventArgs e)
    {
        string ngaythangnamsinh = "";
        ngaythangnamsinh = txtngaysinh.Text + "/" + txtthangsinh.Text + "/" + txtnamsinh.Text;


        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection mySqlConnection;
        mySqlConnection = new SqlConnection(connString);
        mySqlConnection.Open();

        SqlCommand sqlCmd = new SqlCommand("[sp_CHLB_Duc_Insert]");
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

        sqlCmd.Connection = mySqlConnection;
        sqlCmd.ExecuteNonQuery();
        mySqlConnection.Close();

        Response.Redirect(Newwind.VQS.URL + "/successful.aspx");
    }
}