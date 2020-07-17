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

public partial class Modules_dang_ky_thong_tin_tim_viec : System.Web.UI.UserControl
{
    public string strTV = "";
    private string matimviec = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            dpngaysinh.SelectedDate = System.DateTime.Now.AddYears(-18);
            dpNgayxuatcanh.SelectedDate = System.DateTime.Now;
            dpNgayvenuoc.SelectedDate = System.DateTime.Now;
            dpDaotaotu1.SelectedDate = System.DateTime.Now;
            dpDaotaoden1.SelectedDate = System.DateTime.Now;
            dpCVcuthetu1.SelectedDate = System.DateTime.Now;
            dpCVcutheden1.SelectedDate = System.DateTime.Now;
            dpCVcuthetu2.SelectedDate = System.DateTime.Now;
            dpCVcutheden2.SelectedDate = System.DateTime.Now;
            dpCVcuthetu3.SelectedDate = System.DateTime.Now;
            dpCVcutheden3.SelectedDate = System.DateTime.Now;
            BindNganhnghe();
            BindVitri();
        }



        string itv = CMS.TTV.Web.Utils.GetStringFromQueryString("itv", "");
        if (itv == "")
        {
            Random rd = new Random();
            string random = Convert.ToString(rd.Next(11111, 99999));
            txtMatimviec.Text = "TV" + random;
            txtMatimviec.Visible = false;
            btndangky.Enabled = true;
            btndangkytiep.Enabled = false;
            dadangky.Visible = false;
        }
        else
        {
            txtMatimviec.Text = itv;
            strTV = itv;
            txtMatimviec.Visible = true;
            btndangky.Enabled = false;
            btndangkytiep.Enabled = true;
            btndangkyhuy.Enabled = false;
            Binddata(itv);
            
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
    public void BindVitri()
    {
        string sql = "select C_MAVT,C_VITRI from T_DM_VITRI  order by C_MAVT";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            cbovitri.DataSource = dtNews;
            cbovitri.DataTextField = "C_VITRI";
            cbovitri.DataValueField = "C_MAVT";
            cbovitri.DataBind();
            cbovitri.Items.Insert(0, "--- --- ---");
        }
        
    }

    public void BindNganhnghe()
    {
        string sql = "SELECT * from T_DM_NGHE ORDER BY C_MA";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            cboNganhngheduocdaotao1.DataSource = dtNews;
            cboNganhngheduocdaotao1.DataTextField = "C_NGHE";
            cboNganhngheduocdaotao1.DataValueField = "C_MA";
            cboNganhngheduocdaotao1.DataBind();
            cboNganhngheduocdaotao1.Items.Insert(0, "--- --- ---");

            cboNganhnghelamviectainuocngoai1.DataSource = dtNews;
            cboNganhnghelamviectainuocngoai1.DataTextField = "C_NGHE";
            cboNganhnghelamviectainuocngoai1.DataValueField = "C_MA";
            cboNganhnghelamviectainuocngoai1.DataBind();
            cboNganhnghelamviectainuocngoai1.Items.Insert(0, "--- --- ---");

            

            cboNganhnghelamviectainuocngoai2.DataSource = dtNews;
            cboNganhnghelamviectainuocngoai2.DataTextField = "C_NGHE";
            cboNganhnghelamviectainuocngoai2.DataValueField = "C_MA";
            cboNganhnghelamviectainuocngoai2.DataBind();
            cboNganhnghelamviectainuocngoai2.Items.Insert(0, "--- --- ---");

          

            cboNganhnghelamviectainuocngoai3.DataSource = dtNews;
            cboNganhnghelamviectainuocngoai3.DataTextField = "C_NGHE";
            cboNganhnghelamviectainuocngoai3.DataValueField = "C_MA";
            cboNganhnghelamviectainuocngoai3.DataBind();
            cboNganhnghelamviectainuocngoai3.Items.Insert(0, "--- --- ---");

            cboNganhnghedukientimviec.DataSource = dtNews;
            cboNganhnghedukientimviec.DataTextField = "C_NGHE";
            cboNganhnghedukientimviec.DataValueField = "C_MA";
            cboNganhnghedukientimviec.DataBind();
            cboNganhnghedukientimviec.Items.Insert(0, "--- --- ---");

        }
    }

    public void Binddata(string itv)
    {
        string sql = "select * from T_NGUOILAODONG where C_MATIMVIEC='" + itv + "'";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            txthodem.Text = dtNews.Rows[0]["C_HODEM"].ToString();
            txtten.Text = dtNews.Rows[0]["C_TEN"].ToString();
            dpngaysinh.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_NGAYSINH"].ToString());
            cboGioitinh.Value = dtNews.Rows[0]["C_GIOITINH"].ToString();
            txtCMND.Text = dtNews.Rows[0]["C_CMND"].ToString();
            txtDiachi.Text = dtNews.Rows[0]["C_NOICUTRU"].ToString();

            txtHuyen.Text = dtNews.Rows[0]["C_HUYEN"].ToString();
            cboTinh.Value = dtNews.Rows[0]["C_TINH"].ToString();
            cboChuongtrinhthamgia.Value = dtNews.Rows[0]["C_CHUONGTRINH"].ToString();
            txtIDnuocngoai.Text = dtNews.Rows[0]["C_SOID"].ToString();
            dpNgayxuatcanh.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_NGAYXUATCANH"].ToString());

            dpNgayvenuoc.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_NGAYVENUOC"].ToString());
            txtDienthoai.Text = dtNews.Rows[0]["C_DIENTHOAI"].ToString();
            txtEmail.Text = dtNews.Rows[0]["C_EMAIL"].ToString();
            cboNgoaingu.Value = dtNews.Rows[0]["C_NGOAINGU"].ToString();
            cboChungchi.Value = dtNews.Rows[0]["C_CHUNGCHI"].ToString();

            cboNganhngheduocdaotao1.SelectedValue = dtNews.Rows[0]["C_DAOTAONGHE1"].ToString();
            dpDaotaotu1.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_DAOTAOTU1"].ToString());
            dpDaotaoden1.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_DAOTAODEN1"].ToString());
            cboBangcap1.Value = dtNews.Rows[0]["C_BANGCAP1"].ToString();
            txtBangcapkhac1.Text = dtNews.Rows[0]["C_BANGCAPKHAC1"].ToString();
            cboNganhnghelamviectainuocngoai1.SelectedValue = dtNews.Rows[0]["C_NGHELAMVIEC1"].ToString();
            txtCongvieccuthe1.Text = dtNews.Rows[0]["C_CVCUTHE1"].ToString();
            dpCVcuthetu1.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_CVCUTHETU1"].ToString());
            dpCVcutheden1.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_CVCUTHEDEN1"].ToString());


          //  cboNganhngheduocdaotao2.SelectedValue = dtNews.Rows[0]["C_DAOTAONGHE2"].ToString();
            //dpDaotaotu2.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_DAOTAOTU2"].ToString());
            //dpDaotaoden2.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_DAOTAODEN2"].ToString());
            //cboBangcap2.Value = dtNews.Rows[0]["C_BANGCAP2"].ToString();
            //txtBangcapkhac2.Text = dtNews.Rows[0]["C_BANGCAPKHAC2"].ToString();
            cboNganhnghelamviectainuocngoai2.SelectedValue = dtNews.Rows[0]["C_NGHELAMVIEC2"].ToString();
            txtCongvieccuthe2.Text = dtNews.Rows[0]["C_CVCUTHE2"].ToString();
            dpCVcuthetu2.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_CVCUTHETU2"].ToString());
            dpCVcutheden2.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_CVCUTHEDEN2"].ToString());

           // cboNganhngheduocdaotao3.SelectedValue = dtNews.Rows[0]["C_DAOTAONGHE3"].ToString();
            //dpDaotaotu3.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_DAOTAOTU3"].ToString());
            //dpDaotaoden3.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_DAOTAODEN3"].ToString());
            //cboBangcap3.Value = dtNews.Rows[0]["C_BANGCAP3"].ToString();
            //txtBangcapkhac3.Text = dtNews.Rows[0]["C_BANGCAPKHAC3"].ToString();
            cboNganhnghelamviectainuocngoai3.SelectedValue = dtNews.Rows[0]["C_NGHELAMVIEC3"].ToString();
            txtCongvieccuthe3.Text = dtNews.Rows[0]["C_CVCUTHE3"].ToString();
            dpCVcuthetu3.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_CVCUTHETU3"].ToString());
            dpCVcutheden3.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_CVCUTHEDEN3"].ToString());

            cboNganhnghedukientimviec.SelectedValue = dtNews.Rows[0]["C_NGANHNGHEDUKIENTIM"].ToString();
            cbovitri.SelectedValue = dtNews.Rows[0]["C_VITRIMONGMUON"].ToString();
            choMucluongmongmuon.Value = dtNews.Rows[0]["C_MUCLUONGMONGMUON"].ToString();
            cboDiadiemlamviecmongmuon.Value = dtNews.Rows[0]["C_DIADIEMMONGMUON"].ToString();


            DisableTxT();

        }
    }

    public void DisableTxT()
    {
        txthodem.Enabled = false;
        txtten.Enabled = false;
        dpngaysinh.Enabled = false;
        cboGioitinh.Disabled = true;
        txtCMND.Enabled = false;
        txtDiachi.Enabled = false;

        txtHuyen.Enabled = false;
        cboTinh.Disabled = true;
        cboChuongtrinhthamgia.Disabled = true;
        txtIDnuocngoai.Enabled = false;
        dpNgayxuatcanh.Enabled = false;

        dpNgayvenuoc.Enabled = false;
        txtDienthoai.Enabled = false;
        txtEmail.Enabled = false;
        cboNgoaingu.Disabled = true;
        cboChungchi.Disabled = true;

        cboNganhngheduocdaotao1.Enabled = false;
        dpDaotaotu1.Enabled = false;
        dpDaotaoden1.Enabled = false;
        cboBangcap1.Disabled = true;
        txtBangcapkhac1.Enabled = false;
        cboNganhnghelamviectainuocngoai1.Enabled = false;
        txtCongvieccuthe1.Enabled = false;
        dpCVcuthetu1.Enabled = false;
        dpCVcutheden1.Enabled = false;

        //cboNganhngheduocdaotao2.Enabled = false;
        //dpDaotaotu2.Enabled = false;
        //dpDaotaoden2.Enabled = false;
        //cboBangcap2.Disabled = true;
        //txtBangcapkhac2.Enabled = false;
        cboNganhnghelamviectainuocngoai2.Enabled = false;
        txtCongvieccuthe2.Enabled = false;
        dpCVcuthetu2.Enabled = false;
        dpCVcutheden2.Enabled = false;

         //cboNganhngheduocdaotao3.Enabled = false;
        //dpDaotaotu3.Enabled = false;
        //dpDaotaoden3.Enabled = false;
        //cboBangcap3.Disabled = true;
        //txtBangcapkhac3.Enabled = false;
       cboNganhnghelamviectainuocngoai3.Enabled = false;
        txtCongvieccuthe3.Enabled = false;
        dpCVcuthetu3.Enabled = false;
        dpCVcutheden3.Enabled = false;

        cboNganhnghedukientimviec.Enabled = false;
        cbovitri.Enabled = false;
        choMucluongmongmuon.Disabled = true;
        cboDiadiemlamviecmongmuon.Disabled = true;

        btndangky.Enabled = false;
    }

    public void InsertKR()
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection mySqlConnection;
        mySqlConnection = new SqlConnection(connString);
        mySqlConnection.Open();
        SqlCommand sqlCmd = new SqlCommand("[sp_NLD_dangky_KR_Insert]");
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Clear();
        sqlCmd.Parameters.AddWithValue("@C_HODEM", txthodem.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_TEN", txtten.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_NGAYSINH", dpngaysinh.SelectedDate).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_GIOITINH", cboGioitinh.Value).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_CMND", txtCMND.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_NOICUTRU", txtDiachi.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_HUYEN", txtHuyen.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_TINH", cboTinh.Value).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_CHUONGTRINH", cboChuongtrinhthamgia.Value).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_SOID", txtIDnuocngoai.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_NGAYXUATCANH", dpNgayxuatcanh.SelectedDate).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_NGAYVENUOC", dpNgayvenuoc.SelectedDate).Direction = ParameterDirection.Input;

        sqlCmd.Parameters.AddWithValue("@C_DIENTHOAI", txtDienthoai.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_EMAIL", txtEmail.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_NGOAINGU", cboNgoaingu.Value).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_CHUNGCHI", cboChungchi.Value).Direction = ParameterDirection.Input;

        sqlCmd.Parameters.AddWithValue("@C_DAOTAONGHE1", cboNganhngheduocdaotao1.SelectedValue).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_DAOTAOTU1", dpDaotaotu1.SelectedDate).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_DAOTAODEN1", dpDaotaoden1.SelectedDate).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_BANGCAP1", cboBangcap1.Value).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_BANGCAPKHAC1", txtBangcapkhac1.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_NGHELAMVIEC1", cboNganhnghelamviectainuocngoai1.SelectedValue).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_CVCUTHE1", txtCongvieccuthe1.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_CVCUTHETU1", dpCVcuthetu1.SelectedDate).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_CVCUTHEDEN1", dpCVcutheden1.SelectedDate).Direction = ParameterDirection.Input;

       // sqlCmd.Parameters.AddWithValue("@C_DAOTAONGHE2", cboNganhngheduocdaotao2.SelectedValue).Direction = ParameterDirection.Input;
       // sqlCmd.Parameters.AddWithValue("@C_DAOTAOTU2", dpDaotaotu2.SelectedDate).Direction = ParameterDirection.Input;
       // sqlCmd.Parameters.AddWithValue("@C_DAOTAODEN2", dpDaotaoden2.SelectedDate).Direction = ParameterDirection.Input;
       // sqlCmd.Parameters.AddWithValue("@C_BANGCAP2", cboBangcap2.Value).Direction = ParameterDirection.Input;
       // sqlCmd.Parameters.AddWithValue("@C_BANGCAPKHAC2", txtBangcapkhac2.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_NGHELAMVIEC2", cboNganhnghelamviectainuocngoai2.SelectedValue).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_CVCUTHE2", txtCongvieccuthe2.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_CVCUTHETU2", dpCVcuthetu2.SelectedDate).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_CVCUTHEDEN2", dpCVcutheden2.SelectedDate).Direction = ParameterDirection.Input;

        //DateTime cvden = dpCVcutheden2.SelectedDate;


      //  sqlCmd.Parameters.AddWithValue("@C_DAOTAONGHE3", cboNganhngheduocdaotao3.SelectedValue).Direction = ParameterDirection.Input;
       // sqlCmd.Parameters.AddWithValue("@C_DAOTAOTU3", dpDaotaotu3.SelectedDate).Direction = ParameterDirection.Input;
       // sqlCmd.Parameters.AddWithValue("@C_DAOTAODEN3", dpDaotaoden3.SelectedDate).Direction = ParameterDirection.Input;
       // sqlCmd.Parameters.AddWithValue("@C_BANGCAP3", cboBangcap3.Value).Direction = ParameterDirection.Input;
       // sqlCmd.Parameters.AddWithValue("@C_BANGCAPKHAC3", txtBangcapkhac3.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_NGHELAMVIEC3", cboNganhnghelamviectainuocngoai3.SelectedValue).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_CVCUTHE3", txtCongvieccuthe3.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_CVCUTHETU3", dpCVcuthetu3.SelectedDate).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_CVCUTHEDEN3", dpCVcutheden3.SelectedDate).Direction = ParameterDirection.Input;


        sqlCmd.Parameters.AddWithValue("@C_NGANHNGHEDUKIENTIM", cboNganhnghedukientimviec.SelectedValue).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_VITRIMONGMUON", cbovitri.SelectedValue).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_MUCLUONGMONGMUON", choMucluongmongmuon.Value).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_DIADIEMMONGMUON", cboDiadiemlamviecmongmuon.Value).Direction = ParameterDirection.Input;

        sqlCmd.Parameters.AddWithValue("@C_MATIMVIEC", txtMatimviec.Text).Direction = ParameterDirection.Input;



        sqlCmd.Connection = mySqlConnection;
        sqlCmd.ExecuteNonQuery();
        mySqlConnection.Close();
    }

    protected void btndangky_Click(object sender, EventArgs e)
    {
        if (!IsReCaptchValid())
        {
            Page.ClientScript.RegisterStartupScript(typeof(Page), "alert", "<script language=JavaScript>alert('Xác thực không hợp lệ!');</script>");
            return;
        }
        try
        {
            matimviec = CMS.MsSql.ExecuteToString("select C_MATIMVIEC from T_NGUOILAODONG where C_CMND='" + txtCMND.Text.Trim() + "'");
            if (matimviec == "")
            {
                InsertKR();
                Response.Redirect(Newwind.VQS.URL + "/dang-ky-thong-tin-tim-viec.aspx?itv=" + txtMatimviec.Text);
            }
            else
            {
                dadangky.Visible = true;
                luuydk.Visible = false;
                btndangkytiep.Enabled = true;
                btndangky.Enabled = false;
                btndangkyhuy.Enabled = false;
                txtMatimviec.Visible = false;
            }
        }
        catch
        {
            
        }        
    }
    protected void btndangkytiep_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/nld-dang-ky-tim-viec.aspx?itv=" + txtMatimviec.Text); 
    }
    protected void btndangkyhuy_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/dang-ky-thong-tin-tim-viec.aspx"); 
    }
}