using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Modules_dang_ky_tuyen_dung : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    private void txtthunhap_Leave(object sender, EventArgs e)
    {
        Double value;
        if (Double.TryParse(txtthunhap.Text, out value))
            txtthunhap.Text = String.Format(System.Globalization.CultureInfo.CurrentCulture, "{0:C2}", value);
        else
            txtthunhap.Text = String.Empty;
    }


    protected void btngui_Click(object sender, EventArgs e)
    {
        string nhantu = "";
        string nhanden = "";
        try   {

            nhantu = txtngaynhan.Text + "/" + txtthangnhan.Text + "/" + txtnamnhan.Text;
            nhanden = txtdenngay.Text + "/" + txtdenthang.Text + "/" + txtdennam.Text;

        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection mySqlConnection;
        mySqlConnection = new SqlConnection(connString);
        mySqlConnection.Open();
        SqlCommand sqlCmd = new SqlCommand("[sp_Tuyendung_Insert]");
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Clear();
        sqlCmd.Parameters.AddWithValue("@Tencongty", txtcongty.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Nganhnghe", txtnganhnghe.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Diachi", txtdiachi.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Dienthoai", txtdienthoai.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Email", txtemail.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Vitri", txtvitri.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Dieukien", txtdieukien.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Yeucau", txtyeucau.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Soluong", txtsoluong.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Thunhap", txtthunhap.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Hoso", txthoso.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Thoigiannhanhs", nhantu).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Thoigiannhanhsden", nhanden).Direction = ParameterDirection.Input; ;
        sqlCmd.Connection = mySqlConnection;
        sqlCmd.ExecuteNonQuery();
        mySqlConnection.Close();
        }
        catch {
            CMS.Utility.HtmlHelper.Alert("Có lỗi xảy ra trong quá trình thao tác !", this.Page);
        }

        Response.Redirect(Newwind.VQS.URL + "/successful.aspx");

    }
}