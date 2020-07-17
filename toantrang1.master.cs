using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class toantrang1 : System.Web.UI.MasterPage
{
    string control = "Home";
    public string Image_Url = "";
    public string foot = "";
    public int Count = 0;
    public string left = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ctl"] != null)
        {
            control = Request.QueryString["ctl"];
        }
        LoadModulesControl();
        Banner();
        Footer();
        //string sqlright = "SELECT * FROM T_ADV WHERE C_STATUS=1 AND C_TYPE = 'RIGHT'";
        //DataTable dtright = CMS.MsSql.FillDataTable(sqlright);
        //this.dlRight.DataSource = dtright;
        //this.dlRight.DataBind();

        //string sqlclient = "SELECT * FROM T_ADV WHERE C_STATUS=1 AND C_TYPE = 'CLIENT'";
        //DataTable dtclient = CMS.MsSql.FillDataTable(sqlclient);
        //this.dlClient.DataSource = dtclient;
        //this.dlClient.DataBind();
        //Left();

        //string sql1 = "SELECT PK_MENU FROM T_MENU WHERE C_PARENT=406 ORDER BY C_ORDER ASC";
        //DataTable dtProducts = CMS.MsSql.FillDataTable(sql1);
        //this.dlProducts.DataSource = dtProducts;
        //this.dlProducts.DataBind();
    }

    private void Left()
    {
        string sql = "SELECT TOP 1 C_LINK,C_IMAGE_FILE_NAME FROM T_BANNER WHERE C_TYPE='LEFT-RIGHT' AND FK_LANG=1";
        DataRow dr = CMS.SqlCache.FillDataRow(sql);
        left = dr["C_IMAGE_FILE_NAME"].ToString();
        if (left != "") left = left.Substring(2);
    }
    private void Banner()
    {
        string sql = "SELECT TOP 1 C_LINK,C_IMAGE_FILE_NAME FROM T_BANNER WHERE C_TYPE='TOP'";
        DataRow dr = CMS.SqlCache.FillDataRow(sql);
        Image_Url = dr["C_IMAGE_FILE_NAME"].ToString();
        if (Image_Url != "") Image_Url = Image_Url.Substring(2);
    }

    private void Footer()
    {
        string sql = "SELECT TOP 1 C_LINK,C_IMAGE_FILE_NAME FROM T_BANNER WHERE C_TYPE='FOOTER' AND FK_LANG=1";
        DataRow dr = CMS.SqlCache.FillDataRow(sql);
        foot = dr["C_IMAGE_FILE_NAME"].ToString();
        if (foot != "") foot = foot.Substring(2);
    }

    private void LoadModulesControl()
    {
        string path = "Modules2/" + Newwind.VQS.Control + ".ascx";
        try
        {
            if (System.IO.File.Exists(Server.MapPath(path)))
            {
                this.cphMain.Controls.Add(LoadControl(path));
            }
            else Response.Redirect("~/");
        }
        catch (Exception ex)
        {
            if (Request.IsLocal || CMS.Setting.GetBoolSetting("Debug"))
            {
                Response.Write(ex.Message + ex.Source + ex.TargetSite);
            }
            else Response.Redirect("~/");
        }
    }
  
}
