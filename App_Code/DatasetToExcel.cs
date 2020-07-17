using System;
using System.Data;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Whatever
{
    /// 
    /// This class provides a method to write a dataset to the HttpResponse as
    /// an excel file. 
    /// 
    public class ExcelExport
    {
        public static void ExportDataSetToExcel(DataSet ds, string filename)
        {
            HttpResponse response = HttpContext.Current.Response;

            // first let's clean up the response.object
            response.Clear();
            response.Charset = "";

            // set the response mime type for excel
            response.ContentType = "application/vnd.ms-excel";
            response.AddHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");

            // create a string writer
            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter htw = new HtmlTextWriter(sw))
                {
                    // instantiate a datagrid
                    DataGrid dg = new DataGrid();
                    dg.DataSource = ds.Tables[0];
                    dg.DataBind();
                    dg.RenderControl(htw);
                    response.Write(sw.ToString());
                    response.End();
                }
            }
        }
    }

    public class WordExport
    {
        public static void ExportTextToWord(string content, string filename)
        {
            HttpResponse response = HttpContext.Current.Response;

            // first let's clean up the response.object
            response.Clear();
            response.Charset = "";

            // set the response mime type for excel
            response.ContentType = "application/msword";
            response.AddHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
            StringBuilder strHTMLContent = new StringBuilder();
            strHTMLContent.Append(content);
            response.Write(strHTMLContent);
            response.End();
        }
        public static void ExportForm(string id)
        {
            string html = string.Empty;

            DataTable dt = new DataTable();
            string result = string.Empty;
            string ngaydaunhapcanh = string.Empty,
                    tencongty = string.Empty,
                    sodienthoaicongty = string.Empty,
                    diadiemlamviec = string.Empty,
                    sothenguoinuocngoai = string.Empty,
                    sodienthoai = string.Empty,
                    hoten = string.Empty,
                    hochieu = string.Empty;
            string str = "select C_TENDN_HIENTAI, C_TENDN,C_DIACHIDN_HIENTAI,C_DIACHIDN, C_DIENTHOAIDN_HIENTAI,C_DIENTHOAIDN,C_SOTHE, C_NGAYNHAPCANH, C_DIENTHOAI, C_HOTEN, C_HOCHIEU from T_KHAIBAO_THONGTIN where PK_KHAIBAO=" + id;
            DataSet ds = new DataSet();
            ds = CMS.MsSql.FillDataSet(str);
            if (ds.Tables[0].Rows.Count > 0)
            {
                dt = ds.Tables[0];
                tencongty = string.IsNullOrEmpty(dt.Rows[0][0].ToString()) ? dt.Rows[0][1].ToString() : dt.Rows[0][0].ToString();
                diadiemlamviec = string.IsNullOrEmpty(dt.Rows[0][2].ToString()) ? dt.Rows[0][3].ToString() : dt.Rows[0][2].ToString();
                sodienthoaicongty = string.IsNullOrEmpty(dt.Rows[0][4].ToString()) ? dt.Rows[0][5].ToString() : dt.Rows[0][5].ToString();
                ngaydaunhapcanh = dt.Rows[0][7].ToString();
                sothenguoinuocngoai = dt.Rows[0][6].ToString();
                sodienthoai = dt.Rows[0][8].ToString();
                hoten = dt.Rows[0][9].ToString();
                hochieu = dt.Rows[0][10].ToString();
            }

            html = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"> <html xmlns=\"http://www.w3.org/1999/xhtml\" > <head> <title>Test HTML</title> "+
                "<style type=\"text/css\"> .style1 { font-size: large; } .style2 { width: 150px; } </style> </head> <body> " +
                "<p class=\"style1\">ĐĂNG KÝ KHAI BÁO THÔNG TIN CỦA NGƯỜI LAO ĐỘNG LÀM VIỆC TẠI HÀN QUỐC</p> " +
                "<table border=\"0\">"+

                "<tr><td class=\"style2\">Họ tên:</td><td>" + hoten + "</td></tr>"+
                "<tr><td class=\"style2\">Số hộ chiếu:</td><td>" + hochieu + "</td></tr>" +
                "<tr><td class=\"style2\">Số điện thoại: </td><td>" + sodienthoai + "</td></tr>" +
                "<tr><td class=\"style2\">Số thẻ: </td><td>" + sothenguoinuocngoai + "</td></tr>" +
                "<tr><td class=\"style2\">Ngày đầu nhập cảnh: </td><td>" + ngaydaunhapcanh + "</td></tr>" +
                "<tr><td class=\"style2\">Tên công ty: </td><td>" + tencongty + "</td></tr>" +
                "<tr><td class=\"style2\">Số điện thoại công ty: </td><td>" + sodienthoaicongty + "</td></tr>" +
                "<tr><td class=\"style2\">Địa điểm làm việc: </td><td>" + diadiemlamviec + "</td></tr>" +
                "</table>" +
                "</body> </html>";


            Whatever.WordExport.ExportTextToWord(html, hoten + ".doc");
        }
    }

}