using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Modules_dang_ky_tim_viec : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btngui_Click(object sender, EventArgs e)
    {

        string ngaythangnamsinh = "";
        string ngaythangnamvenuoc = "";
        string ngaythangnamxuacanh = "";

        ngaythangnamsinh = txtngaysinh.Text + "/" + txtthangsinh.Text + "/" + txtnamsinh.Text;
        ngaythangnamxuacanh = txtngayxuatcanh.Text + "/" + txtthangxuatcanh.Text + "/" + txtnamxuatcanh.Text;
        ngaythangnamvenuoc = txtngayvenuoc.Text + "/" + txtthangvenuoc.Text + "/" + txtnamvenuoc.Text;

        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection mySqlConnection;
        mySqlConnection = new SqlConnection(connString);
        mySqlConnection.Open();

        SqlCommand sqlCmd = new SqlCommand("[sp_Timviec_Insert]");
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Clear();
        sqlCmd.Parameters.AddWithValue("@Hoten", txthoten.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Ngaysinh", ngaythangnamsinh).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Gioitinh", cbogioitinh.Value).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Diachiguithu", txtguithu.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Email", txtemail.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Dienthoai", txtdienthoai.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Ngayxuatcanh", ngaythangnamxuacanh).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Ngayvenuoc", ngaythangnamvenuoc).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Trinhdo", cbochuongtrinh.Value).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Congviecmongmuon", txtcongviecmongmuon.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Mucluong", txtmucluong.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Diachilamviec", txtdiachimongmuon.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Congvieccuthe", txtcongviecgiao.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Thoigianlamviec", txtthoigianlamviec.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Tennuoc", txttennuoc.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Bangcap", txtbangcap.Text).Direction = ParameterDirection.Input;
        if (cbongoaingu.Value == "khac")
        {
            sqlCmd.Parameters.AddWithValue("@Ngoaingu", txttrinhdokhac.Text).Direction = ParameterDirection.Input;
        }
        else
        {
            sqlCmd.Parameters.AddWithValue("@Ngoaingu", cbongoaingu.Value).Direction = ParameterDirection.Input;
        }
        sqlCmd.Connection = mySqlConnection;
        sqlCmd.ExecuteNonQuery();
        mySqlConnection.Close();

        Response.Redirect(Newwind.VQS.URL + "/successful.aspx");
    }
}