using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Modules_findworker : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        txtMaTD.Attributes.Add("autocomplete", "off");
        txtTimLD.Attributes.Add("autocomplete", "off");
    }

    protected void btndangnhap_Click(object sender, EventArgs e)
    {
        string matuyendung = CMS.MsSql.ExecuteToString("select C_MATUYENDUNG from T_TUYENDUNG_KR where C_MATUYENDUNG='" + txtMaTD.Text + "'");
        if (matuyendung != "") Response.Redirect(Newwind.VQS.URL + "/business-info.aspx?itd=" + txtMaTD.Text + "&reg=0");
        else
        {
            CMS.Utility.HtmlHelper.Alert("Mã đăng ký tuyển dụng chưa tồn tại. Mời bạn chuyển sang mục 2 để đăng ký !", this.Page);
            return;
        }
    }
    protected void txtdangky_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/register-business-info.aspx");
    }
    protected void btntimlaodong_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/searching-worker.aspx?itd=" + txtTimLD.Text + "");
    }
    protected void tbntracuu_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/edit-business-info.aspx");
    }
}