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

public partial class Admin_Modules_Orders : System.Web.UI.UserControl
{
   
    public string GetStatus(object _obj)
    {
        int iOrderState = CMS.Utils.ToInteger(_obj);
        DataRow[] dr = dtState.Select("PK_ORDER_STATE=" + iOrderState);
        if (dr.Length > 0)
        {
            return dr[0]["C_NAME"].ToString();
        }
        return "";
    }

    public DataTable dtState;
    protected void Page_Load(object sender, EventArgs e)
    {
        dtState = CMS.MsSql.FillDataTable("SELECT * FROM T_ORDER_STATE");
    }

    private void SetOrders(string sql, string mess)
    {
        string[] arrID = Request.Form.GetValues("chkOrders");
        if (arrID != null)
        {
            string strIDs = String.Join(",", arrID);
            if (!CMS.TTV.Rule.IsModuleRule("Orders", CMS.TTV.Rules.APPROVE))
            {
                lblAlert.Text = "Bạn không có quyền thực hiện lệnh này";
                return;
            }
            string strSql = sql + " WHERE PK_ORDER IN (" + strIDs + ")";
            if (mess == "xóa") strSql += "; DELETE FROM T_ORDER_DETAIL WHERE FK_ORDER IN (" + strIDs + ")";
            CMS.MsSql.ExecuteNonQuery(strSql);
            gvOrders.DataBind();
            lblAlert.Text = "Đã " + mess + " thành công";
        }
        else lblAlert.Text = "Bạn chưa chọn đặt hàng cần " + mess;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SetOrders("DELETE FROM T_ORDER", "xóa");
    }
}
