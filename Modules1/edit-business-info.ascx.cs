using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Modules_edit_business_info : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        txtMaTD.Attributes.Add("autocomplete", "off");
        txtlaydienthoai.Attributes.Add("autocomplete", "off");
        txtlayemail.Attributes.Add("autocomplete", "off");

        string itd = CMS.TTV.Web.Utils.GetStringFromQueryString("itd", "");
        if (itd != "")
        {
            txtMaTD.Text = itd;
            BindNganhnghe();
            Binddata(itd);
            DisableTXT();
        }
        else
        {
            thongtindoanhnghiep.Visible = false;
        }
        string tel = CMS.TTV.Web.Utils.GetStringFromQueryString("tel", "");
        string em = CMS.TTV.Web.Utils.GetStringFromQueryString("em", "");

        if ((tel != "") && (em != ""))
        {
            Binddata2(tel,em);
            DisableTXT();
            thongtindoanhnghiep.Visible = true;
            txtlayemail.Text = em;
            txtlaydienthoai.Text = tel;

        }
        

    }


    public void BindNganhnghe()
    {
        string sql = "SELECT * from T_DM_NGHE ORDER BY C_MA";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            cbonganhnghe.DataSource = dtNews;
            cbonganhnghe.DataTextField = "C_NGHE_KR";
            cbonganhnghe.DataValueField = "C_MA";
            cbonganhnghe.DataBind();
            cbonganhnghe.Items.Insert(0, "--- --- ---");
        }
    }

    public void Binddata2(string tel,string em)
    {
        string sql = "select * from T_TUYENDUNG_KR where C_DTLIENHE='" + tel + "' and C_EMAIL='"+ em +"'";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            txtTencongty.Text = dtNews.Rows[0]["C_TENCTY"].ToString();
            cbonganhnghe.SelectedValue = dtNews.Rows[0]["C_NGANHNGHE"].ToString();
            txtmota.Text = dtNews.Rows[0]["C_MOTA"].ToString();
            txtdiachicongty.Text = dtNews.Rows[0]["C_DIACHICTY"].ToString();
            txthuyen.Text = dtNews.Rows[0]["C_HUYEN"].ToString();
            cboTinh.Value = dtNews.Rows[0]["C_TINH"].ToString();
            txtwebsite.Text = dtNews.Rows[0]["C_WEBSITE"].ToString();
            txtnguoilienhe.Text = dtNews.Rows[0]["C_NGUOILIENHE"].ToString();
            txtchucdanh.Text = dtNews.Rows[0]["C_CHUCDANH"].ToString();
            txtdienthoailienhe.Text = dtNews.Rows[0]["C_DTLIENHE"].ToString();
            txtemail.Text = dtNews.Rows[0]["C_EMAIL"].ToString();
            Mr.Value = dtNews.Rows[0]["C_MR"].ToString();
            txtmaTuyendung.Text = dtNews.Rows[0]["C_MATUYENDUNG"].ToString();
        }
    }


    public void Binddata(string itd)
    {
        string sql = "select * from T_TUYENDUNG_KR where C_MATUYENDUNG='" + itd + "'";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            txtTencongty.Text = dtNews.Rows[0]["C_TENCTY"].ToString();
            cbonganhnghe.SelectedValue = dtNews.Rows[0]["C_NGANHNGHE"].ToString();
            txtmota.Text = dtNews.Rows[0]["C_MOTA"].ToString();
            txtdiachicongty.Text = dtNews.Rows[0]["C_DIACHICTY"].ToString();
            txthuyen.Text = dtNews.Rows[0]["C_HUYEN"].ToString();
            cboTinh.Value = dtNews.Rows[0]["C_TINH"].ToString();
            txtwebsite.Text = dtNews.Rows[0]["C_WEBSITE"].ToString();
            txtnguoilienhe.Text = dtNews.Rows[0]["C_NGUOILIENHE"].ToString();
            txtchucdanh.Text = dtNews.Rows[0]["C_CHUCDANH"].ToString();
            txtdienthoailienhe.Text = dtNews.Rows[0]["C_DTLIENHE"].ToString();
            txtemail.Text = dtNews.Rows[0]["C_EMAIL"].ToString();
            Mr.Value = dtNews.Rows[0]["C_MR"].ToString();            
        }
    }

    public void DisableTXT()
    {
        txtTencongty.Enabled = false;
        cbonganhnghe.Enabled = false;
        txtmota.Enabled = false;
        txtdiachicongty.Enabled = false;
        txthuyen.Enabled = false;
        cboTinh.Disabled = true;
        txtwebsite.Enabled = false;
        txtnguoilienhe.Enabled = false;
        txtchucdanh.Enabled = false;
        txtdienthoailienhe.Enabled = false;
        txtemail.Enabled = false;
        Mr.Disabled = true;
    }


    public void EnableTXT()
    {
        txtTencongty.Enabled = true;
        cbonganhnghe.Enabled = true;
        txtmota.Enabled = true;
        txtdiachicongty.Enabled = true;
        txthuyen.Enabled = true;
        cboTinh.Disabled = false;
        txtwebsite.Enabled = true;
        txtnguoilienhe.Enabled = true;
        txtchucdanh.Enabled = true;
        txtdienthoailienhe.Enabled = true;
        txtemail.Enabled = true;
        Mr.Disabled = false;
    }

    protected void btndangnhap_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/edit-business-info.aspx?itd=" + txtMaTD.Text + "");
    }
    protected void btnTimkiem_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/edit-business-info.aspx?tel=" + txtlaydienthoai.Text + "&em="+txtlayemail.Text +"");
    }
    
    protected void btnFinish_Click(object sender, EventArgs e)
    {
        string itd = CMS.TTV.Web.Utils.GetStringFromQueryString("itd", "");
        if (itd != "")
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection mySqlConnection;
            mySqlConnection = new SqlConnection(connString);
            mySqlConnection.Open();
            SqlCommand sqlCmd = new SqlCommand("[sp_TuyendungKR_Update]");
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Clear();
            sqlCmd.Parameters.AddWithValue("@Tencongty", txtTencongty.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Nganhnghe", cbonganhnghe.SelectedValue     ).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Mota", txtmota.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Diachi", txtdiachicongty.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@huyen", txthuyen.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@tinh", cboTinh.Value).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Website", txtwebsite.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Mr", Mr.Value).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Nguoilienhe", txtnguoilienhe.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Chucdanh", txtchucdanh.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@DTlienhe", txtdienthoailienhe.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@Email", txtemail.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@MaTuyendung", itd).Direction = ParameterDirection.Input; ;
            sqlCmd.Connection = mySqlConnection;
            sqlCmd.ExecuteNonQuery();
            mySqlConnection.Close();

            DisableTXT();
            Response.Redirect(Newwind.VQS.URL + "/edit-business-info.aspx?itd=" + itd);
        }
    }
}