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

public partial class Modules_Home : System.Web.UI.UserControl
{
    public string bannergiua = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Page.Title = "Trung tâm lao động ngoài nước - Center of Overseas Labor - Colab";

        string sqlvideo = "SELECT * FROM T_VIDEO WHERE C_STATUS=1 ORDER BY PK_VIDEO DESC";
        DataTable dtvideo = CMS.MsSql.FillDataTable(sqlvideo);
        this.dlVideo.DataSource = dtvideo;
        this.dlVideo.DataBind();

        string sql = "SELECT * FROM [T_ADV] WHERE C_STATUS=1 and C_TYPE='CENTER'";
        bannergiua = CMS.MsSql.ExecuteToString(sql);
        if (bannergiua.Length > 5)
        {
            bannergiua = bannergiua.Substring(2);
        //  bannergiua="   <img src=\""+bannergiua+"\"/>";
        }
        else
        {
            bannergiua = "";
        }
       
    }
    public string Replace(object _obj)
    {
        string str = _obj.ToString();
        if (str.Length>3)
        {
            str = Newwind.VQS.URL + str.Replace("~", "");
        }
        return str;
    }
}
