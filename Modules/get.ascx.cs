using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class Modules_get : System.Web.UI.UserControl
{
    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["hoten"]!=null && Request.QueryString["shc"] != null)
            lblResult.Text = getNguoiKhaiBaoHanQuoc(Request.QueryString["hoten"].ToString(), Request.QueryString["shc"].ToString());
        if (Request.QueryString["cap"] != null && Request.QueryString["cha"] != null)
            lblResult.Text = getComboBox(Request.QueryString["cap"].ToString(), Request.QueryString["cha"].ToString(), string.Empty);
        if (Request.QueryString["diadiem"] != null)
            lblResult.Text = getDiaDiem(Request.QueryString["diadiem"].ToString());

    }
    public Boolean checkForSQLInjection(string userInput)

    {

        bool isSQLInjection = false;

        string[] sqlCheckList = { "--",

                                       ";--",

                                       ";",

                                       "/*",

                                       "*/",

                                        "@@",

                                        "@",

                                        "char",

                                       "nchar",

                                       "varchar",

                                       "nvarchar",

                                       "alter",

                                       "begin",

                                       "cast",

                                       "create",

                                       "cursor",

                                       "declare",

                                       "delete",

                                       "drop",

                                       "end",

                                       "exec",

                                       "execute",

                                       "fetch",

                                            "insert",

                                          "kill",

                                             "select",

                                           "sys",

                                            "sysobjects",

                                            "syscolumns",

                                           "table",

                                           "update", 
                                           "and",
                                           "or",
                                           "=",
                                           "/",
                                           "-",
                                           ">",
                                           "<",
                                           "+",
                                           "'",
                                           "`"
                                       };

        string CheckString = userInput.Replace("'", "''");

        for (int i = 0; i <= sqlCheckList.Length - 1; i++)

        {

            if ((CheckString.IndexOf(sqlCheckList[i],

            StringComparison.OrdinalIgnoreCase) >= 0))

            { isSQLInjection = true; }
        }

        return isSQLInjection;
    }

    public string getDiaDiem(string id)
    {
        string result = string.Empty;
        if (checkForSQLInjection(id))
            return result;
        string str = "WITH orderedTree (C_TEN, PK_DIAGIOIHANHCHINH_HANQUOC, depth, location)"+
                       " AS(SELECT C_TEN, "+
                        "           PK_DIAGIOIHANHCHINH_HANQUOC, "+
                         "          0 AS depth, "+
                          "         CAST(PK_DIAGIOIHANHCHINH_HANQUOC AS NVARCHAR(MAX)) AS location "+
                           " FROM T_DIAGIOIHANHCHINH_HANQUOC "+
                            "WHERE C_CAP = 1 "+
                           " UNION ALL "+
                           " SELECT child.C_TEN, "+
                            "       child.PK_DIAGIOIHANHCHINH_HANQUOC, "+
                            "       parent.depth + 1, "+
                            "       CAST(CONCAT(parent.location, ';', child.PK_DIAGIOIHANHCHINH_HANQUOC) AS NVARCHAR(MAX)) AS location "+
                            "FROM T_DIAGIOIHANHCHINH_HANQUOC child "+
                            "    INNER JOIN orderedTree parent "+
                           "         ON child.C_CHA = parent.PK_DIAGIOIHANHCHINH_HANQUOC) "+
                       " SELECT location "+
                       " FROM orderedTree "+
                      "  where CAST(PK_DIAGIOIHANHCHINH_HANQUOC AS NVARCHAR(MAX))= '"+id + "'";
        DataSet ds = new DataSet();
        ds = CMS.MsSql.FillDataSet(str);
        if (ds.Tables[0].Rows.Count > 0)
        {
            result = ds.Tables[0].Rows[0][0].ToString();
        }
        return result;
    }
    public string getComboBox(string cap, string cha, string sl)
    {
        string result = string.Empty;
        if (checkForSQLInjection(cap) || checkForSQLInjection(cha) || checkForSQLInjection(sl))
            return result;
        string str = "select PK_DIAGIOIHANHCHINH_HANQUOC, C_TEN from [T_DIAGIOIHANHCHINH_HANQUOC] where C_CAP = " + cap+" and C_CHA = "+cha;
        DataSet ds = new DataSet();
        ds = CMS.MsSql.FillDataSet(str);
        if (ds.Tables[0].Rows.Count > 0)
        {
            for(int i = 0; i < ds.Tables[0].Rows.Count;i++)
            {

                result += ds.Tables[0].Rows[i][0].ToString() + ":" + ds.Tables[0].Rows[i][1].ToString() + ";";
            }
        }
        return result;
    }
    public string getNguoiKhaiBaoHanQuoc(string hoten, string sohochieu)
    {   
        string result = string.Empty;
        if (checkForSQLInjection(hoten) || checkForSQLInjection(sohochieu))
            return result;
        string ngaydaunhapcanh = string.Empty,
                tencongty = string.Empty,
                sodienthoaicongty = string.Empty,
                diadiemlamviec = string.Empty,
                sothenguoinuocngoai = string.Empty,
                sodienthoai = string.Empty,
                cmnd = string.Empty;
        string str = "select C_TENDN_HIENTAI, C_TENDN,C_DIACHIDN_HIENTAI,C_DIACHIDN, C_DIENTHOAIDN_HIENTAI,C_DIENTHOAIDN,C_SOTHE, C_NGAYNHAPCANH, C_DIENTHOAI,C_CMND from T_KHAIBAO_THONGTIN where ((C_HOTEN=N'" + hoten + "') or (C_NAME=N'" + hoten + "')) and (C_HOCHIEU=N'" + sohochieu + "')";
        DataSet ds = new DataSet();
        ds = CMS.MsSql.FillDataSet(str);
        if(ds.Tables[0].Rows.Count > 0)
        {
            dt = ds.Tables[0];
            tencongty = string.IsNullOrEmpty(dt.Rows[0][0].ToString()) ? dt.Rows[0][1].ToString() : dt.Rows[0][0].ToString();
            diadiemlamviec = string.IsNullOrEmpty(dt.Rows[0][2].ToString()) ? dt.Rows[0][3].ToString() : dt.Rows[0][2].ToString();
            sodienthoaicongty = string.IsNullOrEmpty(dt.Rows[0][4].ToString()) ? dt.Rows[0][5].ToString() : dt.Rows[0][4].ToString();
            ngaydaunhapcanh = dt.Rows[0][7].ToString();
            sothenguoinuocngoai = dt.Rows[0][6].ToString();
            sodienthoai = dt.Rows[0][8].ToString();
            cmnd = dt.Rows[0][9].ToString();
            result = ngaydaunhapcanh + "||" + tencongty + "||" + sodienthoaicongty + "||" + diadiemlamviec + "||" + sothenguoinuocngoai + "||" + sodienthoai+"||"+cmnd;
        }
        else
        {
            result = 0.ToString();
        }
        return result;
    }
    private int Kiemtrakhaibao(string hoten, string sohochieu)
    {
        string lan2 = "";
        lan2 = CMS.MsSql.ExecuteToString("select C_TENDN2 from T_KHAIBAO_THONGTIN where C_HOTEN=N'" + hoten + "' and C_HOCHIEU =N'" + sohochieu + "'");
        string lan3 = "";
        lan3 = CMS.MsSql.ExecuteToString("select C_TENDN3 from T_KHAIBAO_THONGTIN where C_HOTEN=N'" + hoten + "' and C_HOCHIEU =N'" + sohochieu + "'");
        string lan4 = "";
        lan4 = CMS.MsSql.ExecuteToString("select C_TENDN4 from T_KHAIBAO_THONGTIN where C_HOTEN=N'" + hoten + "' and C_HOCHIEU =N'" + sohochieu + "'");
        string lan5 = "";
        lan5 = CMS.MsSql.ExecuteToString("select C_TENDN5 from T_KHAIBAO_THONGTIN where C_HOTEN=N'" + hoten + "' and C_HOCHIEU =N'" + sohochieu + "'");

        if (lan2 == "")
        {
            return 2; //khai bao lan 2
        }
        else if ((lan2 != "") && (lan3 == ""))
        {
            return 3; //khai bao lan 3
        }
        else if ((lan3 != "") && (lan4 == ""))
        {
            return 4; //khai bao lan 4
        }
        else if ((lan4 != "") && (lan5 == ""))
        {
            return 5; //khai bao lan cuoi
        }
        else if (lan5 != "") return 0;
        else return 0;
    }
}