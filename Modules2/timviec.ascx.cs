using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Modules_timviec : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtMaTV.Attributes.Add("autocomplete", "off");
        txtTimLD.Attributes.Add("autocomplete", "off");
    }
    protected void btndangnhap_Click(object sender, EventArgs e)
    {       


        string matimviec = CMS.MsSql.ExecuteToString("select C_MATIMVIEC from T_NGUOILAODONG where C_MATIMVIEC='" + txtMaTV.Text + "'");
        if (matimviec != "") Response.Redirect(Newwind.VQS.URL + "/nld-dang-ky-tim-viec.aspx?itv=" + txtMaTV.Text + "");
        else
        {
            CMS.Utility.HtmlHelper.Alert("Mã đăng ký tìm việc chưa tồn tại. Mời bạn chuyển sang mục 2 để đăng ký !", this.Page);
            return;
        }



    }
    protected void txtdangky_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/dang-ky-thong-tin-tim-viec.aspx");
    }
    protected void btntimlaodong_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/phien-giao-dich-viec-lam.aspx?itv=" + txtTimLD.Text + "");
    }
    protected void tbntracuu_Click(object sender, EventArgs e)
    {
        Response.Redirect(Newwind.VQS.URL + "/nld-sua-thong-tin.aspx");
    }
}