using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Modules_nld_dang_ky_tim_viec : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        

        string phien = CMS.TTV.Web.Utils.GetStringFromQueryString("phien", "");
        if (phien != "")
        {

            ddlListPhienGDVL.SelectedValue = phien;
            BindDoanhnghiepImport(phien);
            ddlDoanhnghiep.Visible = false;

            string cty = CMS.TTV.Web.Utils.GetStringFromQueryString("cty", "");
            if (cty != "")
            {
                ddlDoanhnghiepImport.SelectedValue = cty;
                BindGDVLImport(cty);
            }            
        }
        else
        {
            ddlDoanhnghiepImport.Visible = false;
        }

        if (Request.QueryString["ht"] != null)
        {
            string ht = CMS.TTV.Web.Utils.GetStringFromQueryString("ht", "");           
            ddlHinhthuc.SelectedValue = ht;            

            if (ht == "0")
            {
                BindDoanhnghiep();
            }
            else if (ht == "1")
            {                
                BindPhienGDVL();
            }
           
        }
                     

        string itv = CMS.TTV.Web.Utils.GetStringFromQueryString("itv", "");
        if (itv != "")
        {
            Binddata(itv);
            txtMatimviec.Text = itv;
           
            string itd = CMS.TTV.Web.Utils.GetStringFromQueryString("itd", "");
            if (itd != "")
            {
                ddlDoanhnghiep.SelectedValue = itd;
                BindGDVL(itd);
                string vlid = CMS.TTV.Web.Utils.GetStringFromQueryString("vlid", "");
                if (vlid != "")
                {                    
                    ddlDoanhnghiep.Enabled = false;
                    ddlVitrituyen.Enabled = false;                    
                    btndangkytiep.Enabled = true;
                    //ddlDoanhnghiep.SelectedValue = CMS.TTV.Web.Utils.GetStringFromQueryString("itd", "");
                    ddlVitrituyen.SelectedValue = CMS.TTV.Web.Utils.GetStringFromQueryString("vlid", "");
                }
                else
                {
                    btndangkytiep.Enabled = false;
                    btndangky.Enabled = true;
                }
            }

            string reg = CMS.TTV.Web.Utils.GetStringFromQueryString("reg", "");
            if (reg == "1") btndangky.Enabled = false;
        }


        
        
    }


    public void BindGDVLImport(string cty)
    {
        string sql = "SELECT * FROM T_PHIEN_GDVL_CHITIET WHERE ID=" + cty + " ORDER BY ID";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            ddlVitrituyen.DataSource = dtNews;
            ddlVitrituyen.DataTextField = "C_VITRI";
            ddlVitrituyen.DataValueField = "ID";
            ddlVitrituyen.DataBind();            
        }
    }


    public void BindPhienGDVL()
    {
        string sql = "SELECT ID, C_PHIEN FROM T_PHIEN_GDVL ORDER BY ID DESC";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            ddlListPhienGDVL.DataSource = dtNews;
            ddlListPhienGDVL.DataTextField = "C_PHIEN";
            ddlListPhienGDVL.DataValueField = "ID";
            ddlListPhienGDVL.DataBind();
            ddlListPhienGDVL.Items.Insert(0, "--- Chọn phiên GDVL ---");
        }
    }

    public void BindDoanhnghiepImport(string phien)
    {
        string sql = "SELECT * FROM T_PHIEN_GDVL_CHITIET WHERE FK_PHIEN="+phien+" ORDER BY ID";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            ddlDoanhnghiepImport.DataSource = dtNews;
            ddlDoanhnghiepImport.DataTextField = "C_CTY";
            ddlDoanhnghiepImport.DataValueField = "ID";
            ddlDoanhnghiepImport.DataBind();
            ddlDoanhnghiepImport.Items.Insert(0, "--- Chọn doanh nghiệp ---");
        }
    }

    public void BindDoanhnghiep()
    {
        string sql = "SELECT T_TUYENDUNG_KR.C_MATUYENDUNG, T_TUYENDUNG_KR.C_TENCTY"
                   + " FROM T_TUYENDUNG_KR INNER JOIN T_TUYENDUNG_VIECLAM ON T_TUYENDUNG_KR.C_MATUYENDUNG = T_TUYENDUNG_VIECLAM.FK_CTY"
                   + " WHERE (T_TUYENDUNG_VIECLAM.C_THOIGIANNHANDEN > GETDATE())"
                   + " GROUP BY T_TUYENDUNG_KR.C_MATUYENDUNG, T_TUYENDUNG_KR.C_TENCTY, T_TUYENDUNG_KR.ID ORDER BY T_TUYENDUNG_KR.ID DESC";

        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            ddlDoanhnghiep.DataSource = dtNews;
            ddlDoanhnghiep.DataTextField = "C_TENCTY";
            ddlDoanhnghiep.DataValueField = "C_MATUYENDUNG";
            ddlDoanhnghiep.DataBind();            
            ddlDoanhnghiep.Items.Insert(0, "--- Chọn doanh nghiệp ---");
        }
    }

    public void BindGDVL(string MaDN)
    {
        string sql = "SELECT T_DM_VITRI.C_VITRI_KR, T_TUYENDUNG_VIECLAM.ID FROM T_DM_VITRI INNER JOIN T_TUYENDUNG_VIECLAM ON T_DM_VITRI.C_MAVT = T_TUYENDUNG_VIECLAM.C_VITRI WHERE (T_TUYENDUNG_VIECLAM.FK_CTY = N'" + MaDN + "') order by T_TUYENDUNG_VIECLAM.ID desc";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            ddlVitrituyen.DataSource = dtNews;
            ddlVitrituyen.DataTextField = "C_VITRI_KR";
            ddlVitrituyen.DataValueField = "ID";
            ddlVitrituyen.DataBind();
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
            lblngaysinh.Text = String.Format("{0:dd/MM/yyyy}", dtNews.Rows[0]["C_NGAYSINH"]); 
            lblGioitinh.Text = dtNews.Rows[0]["C_GIOITINH"].ToString();
            txtCMND.Text = dtNews.Rows[0]["C_CMND"].ToString();
            txtDiachi.Text = dtNews.Rows[0]["C_NOICUTRU"].ToString() + " - " + dtNews.Rows[0]["C_HUYEN"].ToString() + " - " + dtNews.Rows[0]["C_TINH"].ToString();

              
            txtDienthoai.Text = dtNews.Rows[0]["C_DIENTHOAI"].ToString();
            txtEmail.Text = dtNews.Rows[0]["C_EMAIL"].ToString();
            
            DisableTxT();

        }
    }

    public void DisableTxT()
    {
        txthodem.Enabled = false;
        txtten.Enabled = false;
        lblngaysinh.Enabled = false;
        lblGioitinh.Enabled = false;
        txtCMND.Enabled = false;
        txtDiachi.Enabled = false;         
        txtDienthoai.Enabled = false;
        txtEmail.Enabled = false;   
       
    }
    protected void btndangky_Click(object sender, EventArgs e)
    {       
       try
        {
            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection mySqlConnection;
            mySqlConnection = new SqlConnection(connString);
            mySqlConnection.Open();

            string ht = "";
            if (Request.QueryString["ht"] != null)
            {
                ht = CMS.TTV.Web.Utils.GetStringFromQueryString("ht", "");
                if (ht == "0")
                {
                    SqlCommand sqlCmd = new SqlCommand("[sp_NLD_dangky_timviec_KR_Insert]");
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.Clear();
                    sqlCmd.Parameters.AddWithValue("@FK_TUYENDUNGVL", ddlVitrituyen.SelectedValue).Direction = ParameterDirection.Input;
                    sqlCmd.Parameters.AddWithValue("@FK_MATV", txtMatimviec.Text).Direction = ParameterDirection.Input;
                    sqlCmd.Connection = mySqlConnection;
                    sqlCmd.ExecuteNonQuery();
                    mySqlConnection.Close();
                }
                else if (ht == "1")
                {
                    SqlCommand sqlCmd = new SqlCommand("[sp_NLD_dangky_timviec_tai_Phien_KR_Insert]");
                    sqlCmd.CommandType = CommandType.StoredProcedure;
                    sqlCmd.Parameters.Clear();
                    sqlCmd.Parameters.AddWithValue("@FK_PHIEN", ddlVitrituyen.SelectedValue).Direction = ParameterDirection.Input;
                    sqlCmd.Parameters.AddWithValue("@FK_MATV", txtMatimviec.Text).Direction = ParameterDirection.Input;
                    sqlCmd.Connection = mySqlConnection;
                    sqlCmd.ExecuteNonQuery();
                    mySqlConnection.Close();
                }
            }

        }
        catch
        {
            CMS.Utility.HtmlHelper.Alert("Có lỗi xảy ra trong quá trình thao tác !", this.Page);
        }

        Response.Redirect(Newwind.VQS.URL + "/nld-dang-ky-tim-viec.aspx?itv=" + CMS.TTV.Web.Utils.GetStringFromQueryString("itv", "") + "&itd=" + CMS.TTV.Web.Utils.GetStringFromQueryString("itd", "") + "&reg=1&vlid=" + ddlVitrituyen.SelectedValue + "&ht=" + CMS.TTV.Web.Utils.GetStringFromQueryString("ht", "") + "");
        ddlDoanhnghiep.SelectedValue = CMS.TTV.Web.Utils.GetStringFromQueryString("itd", "");        
    }
    protected void ddlDoanhnghiep_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/nld-dang-ky-tim-viec.aspx?itv=" + CMS.TTV.Web.Utils.GetStringFromQueryString("itv", "") + "&ht=" + CMS.TTV.Web.Utils.GetStringFromQueryString("ht", "") + "&itd=" + ddlDoanhnghiep.SelectedValue + "");
        btndangky.Enabled = true;
    }

    protected void btndangkytiep_Click(object sender, EventArgs e)
    {
        ddlDoanhnghiep.Enabled = true;
        ddlVitrituyen.Enabled = true;
        btndangky.Enabled = true;
        btndangkytiep.Enabled = false;
        Response.Redirect(Newwind.VQS.URL + "/nld-dang-ky-tim-viec.aspx?itv=" + CMS.TTV.Web.Utils.GetStringFromQueryString("itv", "") + "&itd=" + CMS.TTV.Web.Utils.GetStringFromQueryString("itd", "") + "");
    }
    protected void btndangkyhuy_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/timviec.aspx");
    }
    protected void ddlHinhthuc_SelectedIndexChanged(object sender, EventArgs e)
    {     
        string url = Newwind.VQS.URL + "/nld-dang-ky-tim-viec.aspx?itv=" + Request.QueryString["itv"] + "&ht=" + ddlHinhthuc.SelectedValue + "";        
        Response.Redirect(url);
    }

    protected void ddlListPhienGDVL_SelectedIndexChanged(object sender, EventArgs e)
    {
        string url = Newwind.VQS.URL + "/nld-dang-ky-tim-viec.aspx?itv=" + Request.QueryString["itv"] + "&ht=" + Request.QueryString["ht"] + "&phien=" + ddlListPhienGDVL.SelectedValue+ "";
        Response.Redirect(url);
    }
    protected void ddlDoanhnghiepImport_SelectedIndexChanged(object sender, EventArgs e)
    {
        string url = Newwind.VQS.URL + "/nld-dang-ky-tim-viec.aspx?itv=" + Request.QueryString["itv"] + "&ht=" + Request.QueryString["ht"] + "&phien=" + Request.QueryString["phien"] + "&cty=" + ddlDoanhnghiepImport.SelectedValue + "";
        Response.Redirect(url);
    }
}