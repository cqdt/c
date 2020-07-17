using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Modules_dang_ky_bo_tuc_tieng_han_tren_may_tinh : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btngui_Click(object sender, EventArgs e)
    {
        string ngaythangnamsinh = "";
        string venuoc = "";
        ngaythangnamsinh = txtngaysinh.Text + "/" + txtthangsinh.Text + "/" + txtnamsinh.Text;
        venuoc = txtngayve.Text + "/" + txtthangve.Text + "/" + txtnamve.Text;

        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection mySqlConnection;
        mySqlConnection = new SqlConnection(connString);
        mySqlConnection.Open();

        SqlCommand sqlCmd = new SqlCommand("[sp_Botuc_Insert]");
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Clear();
        sqlCmd.Parameters.AddWithValue("@Hoten", txthoten.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Ngaysinh", ngaythangnamsinh).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Gioitinh", cbogioitinh.Value).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Thuongtru", txtthuongtru.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Ngayvenuoc", venuoc).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Thanghoc", cbothanghoc.Value).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Dienthoai", txtdienthoai.Text).Direction = ParameterDirection.Input;

        sqlCmd.Connection = mySqlConnection;
        sqlCmd.ExecuteNonQuery();
        mySqlConnection.Close();

        //Response.Write("<script type='text/javascript' language='javascript'>alert('Đăng ký thành công ! ');window.location.href='/';</script>");      
        Response.Redirect(Newwind.VQS.URL + "/successful.aspx");

    }
}