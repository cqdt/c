using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Modules_Controls_Search_ce : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void btnTimkiem_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Default.aspx?ctl=Danh-sach-nguoi-lao-dong-duoc-cap-chung-chi-ce&hoten=" + Server.UrlEncode(txtHoten.Text.Trim()) + "&shc=" + Server.UrlEncode(txtSohc.Text.Trim()) + "&mtt=" + Server.UrlEncode(ddlMenus.SelectedValue) + "&tn=" + String.Format("{0:dd/MM/yyyy}", raddTungay.SelectedDate) + "&dn=" + String.Format("{0:dd/MM/yyyy}", raddDenngay.SelectedDate) + "");
    }
    protected void raddTungay_Load(object sender, EventArgs e)
    {        
        if (CMS.Utils.ToString(Request.QueryString["tn"]) != "") raddTungay.SelectedDate = Convert.ToDateTime(Request.QueryString["tn"]);
    }
    protected void raddDenngay_Load(object sender, EventArgs e)
    {        
        if (CMS.Utils.ToString(Request.QueryString["dn"]) != "") raddDenngay.SelectedDate = Convert.ToDateTime(Request.QueryString["dn"]);
    }
    protected void ddlMenus_DataBound(object sender, EventArgs e)
    {
       // DropDownList ddlMenus = (DropDownList)e.Item.FindControl("ddlMenus");
        ddlMenus.Items.Insert(0, new ListItem("-----", "")); 
    }
}
