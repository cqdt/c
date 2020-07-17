using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Modules_dang_ky_khoa_hoc_dao_tao_nghe_ngoai_ngu_eps : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btngui_Click(object sender, EventArgs e)
    {

        string ngaythangnamsinh = "";
        string ngaynhapcanh = "";
        string ngayxuatcanh = "";
        string hancuoi = "";

        ngaythangnamsinh = txtngaysinh.Text + "/" + txtthangsinh.Text + "/" + txtnamsinh.Text;
        ngaynhapcanh = txtngaynhapcanh.Text + "/" + txtthangnhapcanh.Text + "/" + txtnamnhapcanh.Text;
        ngayxuatcanh = txtngayxuatcanh.Text + "/" + txtthangxuatcanh.Text + "/" + txtnamxuatcanh.Text;
        hancuoi = txtngayhancuoi.Text + "/" + txtnamhancuoi.Text + "/" + txtthanghancuoi.Text;


        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection mySqlConnection;
        mySqlConnection = new SqlConnection(connString);
        mySqlConnection.Open();

        SqlCommand sqlCmd = new SqlCommand("[sp_DangkyKhoahoc_Insert]");
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Clear();
        //sqlCmd.Parameters.AddWithValue("@Donvi", txtdonvi.Text).Direction = ParameterDirection.Input;
        //sqlCmd.Parameters.AddWithValue("@Nganhdaotao", txtnganhdaotao.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Thoigiandaotao", txtthoigiandaotao.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Hoten", txthoten.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Ngaysinh", ngaythangnamsinh).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Gioitinh", cbogioitinh.Value).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Hochieucu", txthochieucu.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Hochieumoi", txthochieumoi.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Dienthoai1", txtdienthoai1.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Dienthoai2", txtdienthoai2.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@CMDNVN", txtCMNDVN.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@CMNDNN", txtCMNDNN.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@NgaynhapHQ", ngaynhapcanh).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@NgayveVN", ngayxuatcanh).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@HancuoiCMNDNN", hancuoi).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Email", txtemail.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Quequan", txtquequan.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Thuongtru", txtthuongtru.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Trinhdo", cbotrinhdo.Value).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Ctycuoi", txtctycuoi.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Dienthoaictycuoi", txtdienthoaicty.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Thoigianlamviec", txtthoigianlamviec.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@QuaylaiHQ", cboQuaylaiHQ.Value).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@ThiEPS", cboThiEPS.Value).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Ngaythi", txtngaythi.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Diemthi", txtsodiem.Text).Direction = ParameterDirection.Input;      


        sqlCmd.Connection = mySqlConnection;
        sqlCmd.ExecuteNonQuery();
        mySqlConnection.Close();

        Response.Redirect(Newwind.VQS.URL + "/successful.aspx");
    }
}