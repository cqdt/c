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

public partial class Modules_video : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Newwind.VQS vs = new Newwind.VQS();
        //int idtin = CMS.MsSql.ExecuteToInt("SELECT MAX(PK_ARTICLE) FROM T_ARTICLE WHERE FK_MENU=" + vs.GetInt(0));
        string sqlvideo = "SELECT * FROM T_VIDEO WHERE  PK_VIDEO=" + vs.GetInt(0);
        DataTable dtvideo = CMS.MsSql.FillDataTable(sqlvideo);
        this.dlVideo.DataSource = dtvideo;
        this.dlVideo.DataBind();
    }
    public string Replace(object _obj)
    {
        string str = _obj.ToString();
        if (str.Length > 3)
        {
            str = Newwind.VQS.URL + str.Replace("~", "");
        }
        return str;
    }
}
