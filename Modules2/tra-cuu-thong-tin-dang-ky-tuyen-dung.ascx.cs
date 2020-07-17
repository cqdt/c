using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Modules_tra_cuu_thong_tin_dang_ky_tuyen_dung : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string cty = CMS.Utils.ToString(Request.QueryString["cty"]);
        string dienthoai = CMS.Utils.ToString(Request.QueryString["t"]);
        if ((cty != "") && (dienthoai != "")) this.Binddata(cty, dienthoai);
    }


    protected void btngui_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/tra-cuu-thong-tin-dang-ky-tuyen-dung.aspx?cty=" + txtcongty.Text.Trim() + "&t=" + txtdienthoai.Text.Trim() + "");
    }

    public void Binddata(string cty, string dienthoai)
    {
        SqlCommand command = new SqlCommand("sp_Cty_tuyendung_laodong");
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add(new SqlParameter("@cty", cty));
        command.Parameters.Add(new SqlParameter("@dienthoai", dienthoai));
        DataSet lRet = TTV.Utils.getDataSet(command);
        if (lRet != null && lRet.Tables.Count > 0)
        {
            this.dlKetqua.DataSource = lRet;
            this.dlKetqua.DataKeyField = "PK_TUYENDUNG";
            this.dlKetqua.DataBind();
        }
        else
        {
            dlKetqua.Visible = false;
        }

    }

}