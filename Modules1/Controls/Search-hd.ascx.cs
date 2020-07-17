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

public partial class Modules_Controls_Search_hd : System.Web.UI.UserControl
{
    private string _Type = "";
    public string Type
    {
        set { _Type = value; }
        get { return _Type; }
    }
    int strLv;
    protected void Page_Load(object sender, EventArgs e)
    {        
        string strSearch = CMS.TTV.Web.Utils.GetStringFromQueryString("search", "").Replace("'", "''");
        strLv  = CMS.TTV.Web.Utils.GetIntFromQueryString("lv", 0);
        txtSearch.Text = strSearch;
        //try
        //{
        //   //  
        //}
        //catch { }
       
    }
   
    protected void btnTimkiemhd_Click(object sender, ImageClickEventArgs e)
    {
        if (_Type =="FAQ") Response.Redirect("Default.aspx?ctl=FAQ&search=" + Server.UrlEncode(txtSearch.Text.Trim()) + "&lv=" + Server.UrlEncode(ddlMenus.SelectedValue) + "");
        else Response.Redirect("Default.aspx?ctl=Consulting&search=" + Server.UrlEncode(txtSearch.Text.Trim()) + "&lv=" + Server.UrlEncode(ddlMenus.SelectedValue) + "");
    }
    protected void ddlMenus_DataBound(object sender, EventArgs e)
    {
        ddlMenus.Items.Insert(0, new ListItem("Tất cả", "0"));
        ddlMenus.SelectedValue = CMS.Utils.ToString(strLv); 
    }
}
