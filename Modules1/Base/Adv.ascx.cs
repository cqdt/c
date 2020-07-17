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

public partial class Modules_Base_Adv : System.Web.UI.UserControl
{
    private string _Type = "";
    public string Type
    {
        set { _Type = value; }
        get { return _Type; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Binddata();
    }

    public void Binddata()
    {
        string sql = "SELECT * FROM [T_ADV] WHERE C_STATUS=1 ";
        sql += " AND C_TYPE=N'" + _Type +"'";
        sql += " AND FK_LANG=" + CMS.Lang.LangValue;
        sql += " ORDER BY C_ORDER";
        DataTable dtLink = CMS.SqlCache.FillDataTable(sql);
        this.dlAdv.DataSource = dtLink;
        this.dlAdv.DataKeyField = "PK_ADV";        
        this.dlAdv.DataBind();
    }
}
