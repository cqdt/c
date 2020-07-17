using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Modules_tra_cuu_dang_ky_thong_tin_tim_viec : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string hoten = CMS.Utils.ToString(Request.QueryString["n"]);
        string ngaysinh = CMS.Utils.ToString(Request.QueryString["s"]);
        if ((hoten != "") && (ngaysinh != "")) this.Binddata(hoten, ngaysinh);
    }
    protected void btngui_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/tra-cuu-dang-ky-thong-tin-tim-viec.aspx?n=" + txthoten.Text.Trim() + "&s=" + txtngaysinh.Text.Trim() + "");
    }

    public void Binddata(string hoten, string ngaysinh)
    {
        SqlCommand command = new SqlCommand("sp_NLD_dangky_timviec");
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add(new SqlParameter("@Hoten", hoten));
        command.Parameters.Add(new SqlParameter("@Ngaysinh", ngaysinh));
        DataSet lRet = TTV.Utils.getDataSet(command);
        if (lRet != null && lRet.Tables.Count > 0)
        {
            this.dlKetqua.DataSource = lRet;
            this.dlKetqua.DataKeyField = "PK_TIMVIEC";
            this.dlKetqua.DataBind();
        }
        else
        {
            dlKetqua.Visible = false;
        }

    }
}