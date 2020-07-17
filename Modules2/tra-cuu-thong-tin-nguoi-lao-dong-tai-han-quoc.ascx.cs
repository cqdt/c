using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Modules_tra_cuu_thong_tin_nguoi_lao_dong_tai_han_quoc : System.Web.UI.UserControl
{
    

    public string NotsotheNNN = "";
    public string EmtyInfo = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        txthotentimkiem.Focus();
        nutlenh.Visible = false;
        if (!Page.IsPostBack)
        {
            string hc = CMS.TTV.Web.Utils.GetStringFromQueryString("hc", "");
            string ht = CMS.TTV.Web.Utils.GetStringFromQueryString("ht", "");
            string st = CMS.TTV.Web.Utils.GetStringFromQueryString("st", "");

            txthotentimkiem.Text = ht;
            txtsohochieutimkiem.Text= hc;
                        

            if (st != "")
            {
                string[] sothe = st.Split('-');
                txtsothetimkiem1.Text = sothe[0];
                txtsothetimkiem2.Text = sothe[1];
            }

            Binddata(hc, ht, st);
        }
    }



    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string sotheNNN = "";
        sotheNNN = txtsothetimkiem1.Text + "-" + txtsothetimkiem2.Text;
        if (sotheNNN == "000000-0000000") sotheNNN = "";
        Binddata(txtsohochieutimkiem.Text, txthotentimkiem.Text, sotheNNN);
        Response.Redirect(Newwind.VQS.URL + "/tra-cuu-thong-tin-nguoi-lao-dong-tai-han-quoc.aspx?hc=" + txtsohochieutimkiem.Text + "&ht=" + txthotentimkiem.Text + "&st=" + sotheNNN + "");
    }
    public void Binddata(string hochieu, string hoten, string sothe)
    {

        if ((hochieu == "") && (hoten == "") && (sothe == ""))
        {
            return;
        }
        else
        {
            string sql = "select * from T_KHAIBAO_THONGTIN where 1=1";
            if (hochieu != "") sql += " and C_HOCHIEU = N'" + hochieu + "'";
            if (hoten != "") sql += " and C_HOTEN=N'" + hoten + "'";
            if (sothe != "") sql += " and C_SOTHE = N'" + sothe + "'";

            DataTable dtInfo = CMS.MsSql.FillDataTable(sql);

            if ((dtInfo.Rows.Count > 0) && (sothe == ""))
            {
                NotsotheNNN = "<p class=\"successful ketqua\">&nbsp;&nbsp;" + hoten + " - Bạn đã khai báo<br /><i style=\"font-size:12px;font-weight:normal;\">&nbsp;•	Nhập thêm số Thẻ người nước ngoài để xem toàn bộ thông tin của mình  <br />&nbsp;•	Nếu có sự thay đổi thông tin, yêu cầu khai báo bổ sung</i></p>";               
                dlKetqua.Visible = false;
                txtsothetimkiem1.Focus();
            }
            else if ((dtInfo.Rows.Count > 0) && (sothe != ""))
            {
                this.dlKetqua.DataSource = dtInfo;
                this.dlKetqua.DataKeyField = "PK_KHAIBAO";
                this.dlKetqua.DataBind();
                nutlenh.Visible = true;

            }
            else if (dtInfo.Rows.Count <= 0)
            {
                EmtyInfo = "<center><p class=\"successful\">Bạn chưa khai báo hoặc nhập sai thông tin</p></center>";
            }
        }
    }

    
    protected void btnFinish_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/khai-bao-thong-tin-nguoi-lao-dong-tai-han-quoc.aspx");
    }
   
   
}