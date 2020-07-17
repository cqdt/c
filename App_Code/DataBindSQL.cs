using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
/// <summary>
/// Summary description for DataBindSQL
/// </summary>
public class DataBindSQL
{
	public DataBindSQL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    //Hàm thực thi và trả về DataTable
	    public DataTable TableThongKe()
	    {
	        DataTable dtb = new DataTable();
	        // Khai báo chuỗi kết nối
	      //  string ConnectionString =
	        //@"Server =.\SQL2005;Initial Catalog=QuanLyThuVien;User ID=sa;Password=sa";
            SqlConnection Conn =  new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
	        try
	        {
	             // Mở kết nối
	            Conn.Open();
	            DataSet ds = new DataSet();
	            SqlCommand cmdUpd = new SqlCommand("spThongKe_Edit", Conn);
	            cmdUpd.CommandType = CommandType.StoredProcedure;
	            SqlDataAdapter da = new SqlDataAdapter(cmdUpd);
	            // Đổ dữ liệu vào DataSet
            da.Fill(ds);
            dtb = ds.Tables[0];
	        }
	        catch { }
	        finally
	        {
	            if (Conn.State == ConnectionState.Open)
	                Conn.Close();
	            Conn.Dispose();
        }
	        return dtb;
	    }
}
