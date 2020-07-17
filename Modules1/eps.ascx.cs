using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Modules_eps : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string hoten = CMS.Utils.ToString(Request.QueryString["n"]);
        string sbd = CMS.Utils.ToString(Request.QueryString["sbd"]);
        string cmnd = CMS.Utils.ToString(Request.QueryString["cmnd"]);
        string hc = CMS.Utils.ToString(Request.QueryString["hc"]);
        if (hoten != "") this.Binddata(hoten, sbd,cmnd,hc);
    }
    protected void btngui_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/eps.aspx?n=" + txthoten.Text.Trim() + "&sbd=" + txtsbd.Text.Trim() + "&cmnd=" + txtcmnd.Text.Trim() + "&hc=" + txthochieu.Text.Trim() + "");
    }
    public void Binddata(string hoten, string sbd,string cmnd, string hc)
    {
        SqlCommand command = new SqlCommand("sp_Getinfo_EPS");
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add(new SqlParameter("@Hoten", hoten));
        command.Parameters.Add(new SqlParameter("@sbd", sbd));
        command.Parameters.Add(new SqlParameter("@cmnd", cmnd));
        command.Parameters.Add(new SqlParameter("@hc", hc));
        DataSet lRet = TTV.Utils.getDataSet(command);
        if (lRet != null && lRet.Tables.Count > 0)
        {
            this.dlKetqua.DataSource = lRet;
            this.dlKetqua.DataKeyField = "PK_TINHTRANG";
            this.dlKetqua.DataBind();
        }
        else
        {
            dlKetqua.Visible = false;
        }
    }
}