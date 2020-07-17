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

public partial class Modules_Base_Banner : System.Web.UI.UserControl
{
    private string _Type = "CENTER";
    public string Type
    {
        set { _Type = value; }
        get { return _Type; }
    }

    private int _ImageWidth = 0;
    public int ImageWidth
    {
        set { _ImageWidth = value; }
        get { return _ImageWidth; }
    }

    private int _ImageHeight = 0;
    public int ImageHeight
    {
        set { _ImageHeight = value; }
        get { return _ImageHeight; }
    }

    public string Image_Url = "";
    public string Url = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        string sql = "SELECT TOP 1 C_LINK,C_IMAGE_FILE_NAME FROM T_BANNER WHERE C_TYPE='" + _Type + "' AND FK_LANG=" +CMS.Lang.LangValue;
        DataRow dr = CMS.SqlCache.FillDataRow(sql);
        Image_Url = dr["C_IMAGE_FILE_NAME"].ToString();
        Url = dr["C_LINK"].ToString();
    }
}
