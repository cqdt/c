using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net;
using System.IO;
using Newtonsoft.Json.Linq;


public partial class Modules_register_business_info : System.Web.UI.UserControl
{
    public string strTV="";

    protected void Page_Load(object sender, EventArgs e)
    {
        string itd = CMS.TTV.Web.Utils.GetStringFromQueryString("itd", "");
        if (itd == "")
        {
            
            Random rd = new Random();
            string random = Convert.ToString(rd.Next(1111, 9999));
            txtMaTD.Text = "TD" + random;
            txtMaTD.Visible = false;

            btndangky.Enabled = true;
            btndangkytiep.Enabled = false;
            BindNganhnghe();
        }
        else {
            strTV = itd;
            txtMaTD.Text = itd;
            btndangky.Enabled = false;
            btndangkytiep.Enabled = true;
            Binddata(itd);
        }
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
            Mr.Value = dtNews.Rows[0]["C_MR"].ToString();
            txtnguoilienhe.Text = dtNews.Rows[0]["C_NGUOILIENHE"].ToString();
            txtchucdanh.Text = dtNews.Rows[0]["C_CHUCDANH"].ToString();
            txtdienthoailienhe.Text = dtNews.Rows[0]["C_DTLIENHE"].ToString();
            txtemail.Text = dtNews.Rows[0]["C_EMAIL"].ToString();
        }
    }

    protected void btndangkytiep_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/business-info.aspx?itd=" + txtMaTD.Text);
    }
    protected void btndangky_Click(object sender, EventArgs e)
    {
        if (!IsReCaptchValid())
        {
            Page.ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=JavaScript>alert('Xác thực không hợp lệ!');</script>");
            return;
        }
        string matuyendung = "";

        try {
            matuyendung = CMS.MsSql.ExecuteToString("select C_MATUYENDUNG from T_TUYENDUNG_KR where C_DTLIENHE='" + txtdienthoailienhe.Text.Trim() + "' or C_EMAIL='" + txtemail .Text.Trim()+ "'");
            if (matuyendung == "")
            {
                DangkyDN();
                Response.Redirect(Newwind.VQS.URL + "/register-business-info.aspx?itd=" + txtMaTD.Text);
                luuy.Visible = true;
                thongbao.Visible = false;
            }
            else
            {
                luuy.Visible = false;
                thongbao.Visible = true;
            }
        }
        catch {
            CMS.Utility.HtmlHelper.Alert("Có lỗi xảy ra trong quá trình thao tác !", this.Page);
        }
       
    }


    public void DangkyDN()
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection mySqlConnection;
        mySqlConnection = new SqlConnection(connString);
        mySqlConnection.Open();
        SqlCommand sqlCmd = new SqlCommand("[sp_TuyendungKR_Insert]");
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Clear();
        sqlCmd.Parameters.AddWithValue("@Tencongty", txtTencongty.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@Nganhnghe", cbonganhnghe.SelectedValue).Direction = ParameterDirection.Input;
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
        sqlCmd.Parameters.AddWithValue("@MaTuyendung", txtMaTD.Text).Direction = ParameterDirection.Input; ;
        sqlCmd.Connection = mySqlConnection;
        sqlCmd.ExecuteNonQuery();
        mySqlConnection.Close();
    }

    protected void btndangkyhuy_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/findworker.aspx");
    }
}