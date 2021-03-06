﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class Modules_Base_Chi_tiet_ho_so : System.Web.UI.UserControl
{
    private bool IsBindData = false;
    int hID;
    protected void Page_Load(object sender, EventArgs e)
    {
        hID = CMS.TTV.Web.Utils.GetIntFromQueryString("hID", -1);
        if (!IsBindData) this.Binddata();
    }
    public void Binddata()
    {
        string sql = "select * from T_TIM_VIEC where C_STATUS=1";
        if (hID > 0) sql += " and PK_TIM_VIEC = " + hID;
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        this.gvArticles.DataSource = dtNews;
        this.gvArticles.DataKeyNames = new string[] { "PK_TIM_VIEC" };
        this.gvArticles.DataBind();
    }
}
