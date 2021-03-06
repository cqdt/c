﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Modules_khai_bao_thong_tin_nguoi_lao_dong_tai_han_quoc : System.Web.UI.UserControl
{
 
   

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //{
        //  DisableTextAll();
        //}

       
    }

    private void DisableTextAll()
    {
        txthotenkhaibaolandau.Enabled = false;
        txthochieukhaibaolandau.Enabled = false;
        txtngaynhapcanhlandau.Enabled = false;
        txtthangnhapcanhlandau.Enabled = false;
        txtnamnhapcanhlandau.Enabled = false;
        txtCMNDVN.Enabled = false;
        txtemail.Enabled = false;

        txtdoanhnghiep.Enabled = false;
        txtnguoisudunglaodong.Enabled = false;
        txtdienthoaidoanhnghiep1.Enabled = false;
        txtdienthoaidoanhnghiep2.Enabled = false;
        txtdienthoaidoanhnghiep3.Enabled = false;
        txtdiachilamviec.Enabled = false;
        txtngaybatdaulamviec.Enabled = false;
        txtthangbatdaulamviec.Enabled = false;
        txtnambatdaulamviec.Enabled = false;

        txtsothekhaibaolandau1.Enabled = false;
        txtsothekhaibaolandau2.Enabled = false;
        txtdienthoainguoilaodong1.Enabled = false;
        txtdienthoainguoilaodong2.Enabled = false;
        txtdienthoainguoilaodong3.Enabled = false;

        txthotenhoihuong.Enabled = false;
        txthochieuhoihuong.Enabled = false;
        txtdenngay.Enabled = false;
        txtdenthang.Enabled = false;
        txtdennam.Enabled = false;

        cbolydo.Disabled = true;
        txtngayhethan.Enabled = false;
        txtthanghethan.Enabled = false;
        txtnamhethan.Enabled = false;
        txtngayvenuoc.Enabled = false;
        txtthangvenuoc.Enabled = false;
        txtnamvenuoc.Enabled = false;
        btnRegister.Enabled = false;
    }

    private void Khaibaolandau(string mucdich)
    {
        string ngaynhapcanh = "";
        ngaynhapcanh = txtngaynhapcanhlandau.Text + "/" + txtthangnhapcanhlandau.Text + "/" + txtnamnhapcanhlandau.Text;
        
        string dienthoaidoanhnghiep1 = "";
        dienthoaidoanhnghiep1 = txtdienthoaidoanhnghiep1.Text + "-" + txtdienthoaidoanhnghiep2.Text + "-" + txtdienthoaidoanhnghiep3.Text;

        string ngaybatdaulamviectaicongty1 = "";
        ngaybatdaulamviectaicongty1 = txtngaybatdaulamviec.Text + "/" + txtthangbatdaulamviec.Text + "/" + txtnambatdaulamviec.Text;

        string sothenguoinuocngoai = "";
        sothenguoinuocngoai = txtsothekhaibaolandau1.Text + "-" + txtsothekhaibaolandau2.Text;

        string dienthoainguoilaodong = "";
        dienthoainguoilaodong = txtdienthoainguoilaodong1.Text + "-" + txtdienthoainguoilaodong2.Text + "-" + txtdienthoainguoilaodong3.Text;


        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection mySqlConnection;
        mySqlConnection = new SqlConnection(connString);
        mySqlConnection.Open();

        SqlCommand sqlCmd = new SqlCommand("[sp_EPS_Khaibaolandau_Insert]");
        sqlCmd.CommandType = CommandType.StoredProcedure;
        sqlCmd.Parameters.Clear();

        sqlCmd.Parameters.AddWithValue("@C_MUCDICH", mucdich).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_NAME", Newwind.VN.Remove(txthotenkhaibaolandau.Text.ToUpper())).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_HOTEN", txthotenkhaibaolandau.Text.ToUpper()).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_HOCHIEU", txthochieukhaibaolandau.Text.ToUpper()).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_NGAYNHAPCANH", ngaynhapcanh).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_CMND", txtCMNDVN.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_EMAIL", txtemail.Text).Direction = ParameterDirection.Input;

        sqlCmd.Parameters.AddWithValue("@C_TENDN1", txtdoanhnghiep.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_NGUOISUDUNGLAODONG1", txtnguoisudunglaodong.Text.ToUpper()).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_DIENTHOAIDN1", dienthoaidoanhnghiep1).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_DIACHIDN1", txtdiachilamviec.Text).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_NGAYLAMVIECDN1", ngaybatdaulamviectaicongty1).Direction = ParameterDirection.Input;

        sqlCmd.Parameters.AddWithValue("@C_SOTHE", sothenguoinuocngoai).Direction = ParameterDirection.Input;
        sqlCmd.Parameters.AddWithValue("@C_DIENTHOAI", dienthoainguoilaodong).Direction = ParameterDirection.Input;

        
        sqlCmd.Connection = mySqlConnection;
        sqlCmd.ExecuteNonQuery();
        mySqlConnection.Close();
        Response.Redirect(Newwind.VQS.URL + "/khai-bao-lan-dau.aspx?hc="+ txthochieukhaibaolandau.Text +"&ht="+ txthotenkhaibaolandau.Text +"&st="+ sothenguoinuocngoai +"");
    }

    private void Khaibaothaydoinoilamviec(string mucdich)
    {
        if (KiemtraNLD(txthotenkhaibaolandau.Text, txthochieukhaibaolandau.Text))
        {        
            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection mySqlConnection;
            mySqlConnection = new SqlConnection(connString);
            mySqlConnection.Open();

            if (Kiemtrakhaibao(txthotenkhaibaolandau.Text, txthochieukhaibaolandau.Text) == 2)  //khai bao lan 2
            {
                string dienthoaidoanhnghiep2 = "";
                dienthoaidoanhnghiep2 = txtdienthoaidoanhnghiep1.Text + "-" + txtdienthoaidoanhnghiep2.Text + "-" + txtdienthoaidoanhnghiep3.Text;
                string ngaybatdaulamviecdn2 = "";
                ngaybatdaulamviecdn2 = txtngaybatdaulamviec.Text + "/" + txtthangbatdaulamviec.Text + "/" + txtnambatdaulamviec.Text;


                SqlCommand sqlCmd = new SqlCommand("[sp_EPS_Khaibaothaydoinoilamvie_Update_Lan_2]");
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.Clear();
                sqlCmd.Parameters.AddWithValue("@C_MUCDICH", mucdich).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_HOTEN", txthotenkhaibaolandau.Text).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_HOCHIEU", txthochieukhaibaolandau.Text).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_TENDN2", txtdoanhnghiep.Text).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_NGUOISUDUNGLAODONG2", txtnguoisudunglaodong.Text.ToUpper()).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_DIENTHOAIDN2", dienthoaidoanhnghiep2).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_DIACHIDN2", txtdiachilamviec.Text).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_NGAYLAMVIECDN2", ngaybatdaulamviecdn2).Direction = ParameterDirection.Input;
                sqlCmd.Connection = mySqlConnection;
                sqlCmd.ExecuteNonQuery();
                mySqlConnection.Close();
            }
            else if (Kiemtrakhaibao(txthotenkhaibaolandau.Text, txthochieukhaibaolandau.Text) == 3) //khai bao lan 3
            {
                string dienthoaidoanhnghiep3 = "";
                dienthoaidoanhnghiep3 = txtdienthoaidoanhnghiep1.Text + "-" + txtdienthoaidoanhnghiep2.Text + "-" + txtdienthoaidoanhnghiep3.Text;
                string ngaybatdaulamviecdn3 = "";
                ngaybatdaulamviecdn3 = txtngaybatdaulamviec.Text + "/" + txtthangbatdaulamviec.Text + "/" + txtnambatdaulamviec.Text;


                SqlCommand sqlCmd = new SqlCommand("[sp_EPS_Khaibaothaydoinoilamvie_Update_Lan_3]");
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.Clear();
                sqlCmd.Parameters.AddWithValue("@C_MUCDICH", mucdich).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_HOTEN", txthotenkhaibaolandau.Text).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_HOCHIEU", txthochieukhaibaolandau.Text).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_TENDN3", txtdoanhnghiep.Text).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_NGUOISUDUNGLAODONG3", txtnguoisudunglaodong.Text.ToUpper()).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_DIENTHOAIDN3", dienthoaidoanhnghiep3).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_DIACHIDN3", txtdiachilamviec.Text).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_NGAYLAMVIECDN3", ngaybatdaulamviecdn3).Direction = ParameterDirection.Input;
                sqlCmd.Connection = mySqlConnection;
                sqlCmd.ExecuteNonQuery();
                mySqlConnection.Close();
            }
            else if (Kiemtrakhaibao(txthotenkhaibaolandau.Text, txthochieukhaibaolandau.Text) == 4) //khai bao lan 4
            {
                string dienthoaidoanhnghiep4 = "";
                dienthoaidoanhnghiep4 = txtdienthoaidoanhnghiep1.Text + "-" + txtdienthoaidoanhnghiep2.Text + "-" + txtdienthoaidoanhnghiep3.Text;
                string ngaybatdaulamviecdn4 = "";
                ngaybatdaulamviecdn4 = txtngaybatdaulamviec.Text + "/" + txtthangbatdaulamviec.Text + "/" + txtnambatdaulamviec.Text;


                SqlCommand sqlCmd = new SqlCommand("[sp_EPS_Khaibaothaydoinoilamvie_Update_Lan_4]");
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.Clear();
                sqlCmd.Parameters.AddWithValue("@C_MUCDICH", mucdich).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_HOTEN", txthotenkhaibaolandau.Text).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_HOCHIEU", txthochieukhaibaolandau.Text).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_TENDN4", txtdoanhnghiep.Text).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_NGUOISUDUNGLAODONG4", txtnguoisudunglaodong.Text.ToUpper()).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_DIENTHOAIDN4", dienthoaidoanhnghiep4).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_DIACHIDN4", txtdiachilamviec.Text).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_NGAYLAMVIECDN4", ngaybatdaulamviecdn4).Direction = ParameterDirection.Input;
                sqlCmd.Connection = mySqlConnection;
                sqlCmd.ExecuteNonQuery();
                mySqlConnection.Close();
            }
            else if (Kiemtrakhaibao(txthotenkhaibaolandau.Text, txthochieukhaibaolandau.Text) == 5) //khai bao lan 5
            {
                string dienthoaidoanhnghiep5 = "";
                dienthoaidoanhnghiep5 = txtdienthoaidoanhnghiep1.Text + "-" + txtdienthoaidoanhnghiep2.Text + "-" + txtdienthoaidoanhnghiep3.Text;
                string ngaybatdaulamviecdn5 = "";
                ngaybatdaulamviecdn5 = txtngaybatdaulamviec.Text + "/" + txtthangbatdaulamviec.Text + "/" + txtnambatdaulamviec.Text;


                SqlCommand sqlCmd = new SqlCommand("[sp_EPS_Khaibaothaydoinoilamvie_Update_Lan_5]");
                sqlCmd.CommandType = CommandType.StoredProcedure;
                sqlCmd.Parameters.Clear();
                sqlCmd.Parameters.AddWithValue("@C_MUCDICH", mucdich).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_HOTEN", txthotenkhaibaolandau.Text).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_HOCHIEU", txthochieukhaibaolandau.Text).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_TENDN5", txtdoanhnghiep.Text).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_NGUOISUDUNGLAODONG5", txtnguoisudunglaodong.Text.ToUpper()).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_DIENTHOAIDN5", dienthoaidoanhnghiep5).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_DIACHIDN5", txtdiachilamviec.Text).Direction = ParameterDirection.Input;
                sqlCmd.Parameters.AddWithValue("@C_NGAYLAMVIECDN5", ngaybatdaulamviecdn5).Direction = ParameterDirection.Input;
                sqlCmd.Connection = mySqlConnection;
                sqlCmd.ExecuteNonQuery();
                mySqlConnection.Close();
            }
            else if (Kiemtrakhaibao(txthotenkhaibaolandau.Text, txthochieukhaibaolandau.Text) == 0)
            {
                Response.Redirect(Newwind.VQS.URL + "/khai-bao-thay-doi-noi-lam-viec.aspx?kq=2");
            }

            Response.Redirect(Newwind.VQS.URL + "/khai-bao-thay-doi-noi-lam-viec.aspx?kq=1&hc=" + txthochieukhaibaolandau.Text.Trim() + "&ht=" + txthotenkhaibaolandau.Text.Trim() + "&st=" + CMS.MsSql.ExecuteToString("select C_SOTHE from T_KHAIBAO_THONGTIN where C_HOTEN=N'" + txthotenkhaibaolandau.Text + "' and C_HOCHIEU=N'"+ txthochieukhaibaolandau.Text +"'") + "");
        }
        else
        {
            Response.Redirect(Newwind.VQS.URL + "/khai-bao-thay-doi-noi-lam-viec.aspx?kq=0");
        }
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
        else if ((lan2 != "") && (lan3 ==""))
        {
            return 3; //khai bao lan 3
        }
        else if ((lan3 != "") && (lan4==""))
        {
            return 4; //khai bao lan 4
        }
        else if ((lan4 != "") && (lan5 ==""))
        {
            return 5; //khai bao lan cuoi
        }
        else if (lan5 != "") return 0;
        else return 0;
    }

    private bool KiemtraNLD(string hoten, string sohochieu)
    {
        string sql = "select PK_KHAIBAO from T_KHAIBAO_THONGTIN where C_HOTEN=N'" + hoten + "' and C_HOCHIEU =N'" + sohochieu + "'";
        int kq = CMS.MsSql.ExecuteToInt(sql);
        if (kq > 0) return true;
        else return false;
    }

    private void Khaibaothaydoisodienthoai(string mucdich)
    {

        if (KiemtraNLD(txthotenkhaibaolandau.Text, txthochieukhaibaolandau.Text))
        {
            string dienthoainguoilaodong = "";
            dienthoainguoilaodong = txtdienthoainguoilaodong1.Text + "-" + txtdienthoainguoilaodong2.Text + "-" + txtdienthoainguoilaodong3.Text;

            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection mySqlConnection;
            mySqlConnection = new SqlConnection(connString);
            mySqlConnection.Open();

            SqlCommand sqlCmd = new SqlCommand("[sp_EPS_Khaibaothaydoisodienthoai_Update]");
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Clear();
            sqlCmd.Parameters.AddWithValue("@C_MUCDICH", mucdich).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_HOTEN", txthotenkhaibaolandau.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_HOCHIEU", txthochieukhaibaolandau.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_DIENTHOAI", dienthoainguoilaodong).Direction = ParameterDirection.Input;

            sqlCmd.Connection = mySqlConnection;
            sqlCmd.ExecuteNonQuery();
            mySqlConnection.Close();
            Response.Redirect(Newwind.VQS.URL + "/khai-bao-thay-doi-so-dien-thoai.aspx?kq=1&hc=" + txthochieukhaibaolandau.Text.Trim() + "&ht=" + txthotenkhaibaolandau.Text.Trim() + "&st=" + CMS.MsSql.ExecuteToString("select C_SOTHE from T_KHAIBAO_THONGTIN where C_HOTEN=N'" + txthotenkhaibaolandau.Text + "' and C_HOCHIEU=N'" + txthochieukhaibaolandau.Text + "'") + "");
        }
        else
        {
            Response.Redirect(Newwind.VQS.URL + "/khai-bao-thay-doi-so-dien-thoai.aspx?kq=0");
        }

    }

    private void Khaibaolancuoidehoihuong(string mucdich)
    {
        if (KiemtraNLD(txthotenhoihuong.Text, txthochieuhoihuong.Text))
        {
            string thoihanhopdongcuoi = "";
            thoihanhopdongcuoi = txtdenngay.Text + "/" + txtdenthang.Text + "/" + txtdennam.Text;

            string ngayhethan = "";
            ngayhethan = txtngayhethan.Text + "/" + txtthanghethan.Text + "/" + txtnamhethan.Text;

            string ngaydkvenuoc = "";
            ngaydkvenuoc = txtngayvenuoc.Text + "/" + txtthangvenuoc.Text + "/" + txtnamvenuoc.Text;


            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection mySqlConnection;
            mySqlConnection = new SqlConnection(connString);
            mySqlConnection.Open();

            SqlCommand sqlCmd = new SqlCommand("[sp_EPS_Khaibaolancuoidehoihuong_Update]");
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCmd.Parameters.Clear();

            sqlCmd.Parameters.AddWithValue("@C_MUCDICH", mucdich).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_HOTEN", txthotenhoihuong.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_HOCHIEU", txthochieuhoihuong.Text).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_HOPDONGDEN", thoihanhopdongcuoi).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_LYDO", cbolydo.Value).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_NGAYHETHAN", ngayhethan).Direction = ParameterDirection.Input;
            sqlCmd.Parameters.AddWithValue("@C_NGAYDANGKYVENUOC", ngaydkvenuoc).Direction = ParameterDirection.Input;

            sqlCmd.Connection = mySqlConnection;
            sqlCmd.ExecuteNonQuery();
            mySqlConnection.Close();
            Response.Redirect(Newwind.VQS.URL + "/khai-bao-lan-cuoi-de-hoi-huong.aspx?kq=1&hc=" + txthochieuhoihuong.Text.Trim() + "&ht=" + txthotenhoihuong.Text.Trim() + "&st=" + CMS.MsSql.ExecuteToString("select C_SOTHE from T_KHAIBAO_THONGTIN where C_HOTEN=N'" + txthotenhoihuong.Text + "' and C_HOCHIEU=N'" + txthochieuhoihuong.Text + "'") + "");
        }
        else
        {
            Response.Redirect(Newwind.VQS.URL + "/khai-bao-lan-cuoi-de-hoi-huong.aspx?kq=0");
        }
    }

    private bool checkthongtin(string hoten,string sohochieu)
    {
        int PK_KHAIBAO = CMS.MsSql.ExecuteToInt("select PK_KHAIBAO from T_KHAIBAO_THONGTIN where (C_HOTEN=N'" + hoten + "') or (C_NAME=N'" + hoten + "') or (C_HOCHIEU=N'" + sohochieu + "')");
        if (PK_KHAIBAO > 0) return true; //da khai bao
        else return false; //chua khai bao
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {       
       string mucdich= cbomucdich.Value;
       if (mucdich == "Khai báo lần đầu")
       {
           if (checkthongtin(txthotenkhaibaolandau.Text.Trim(), txthochieukhaibaolandau.Text.Trim()))
           {
               CMS.Utility.HtmlHelper.Alert("Bạn đã khai báo lần đầu. Đề nghị chọn khai báo thay đổi thông tin!", this.Page);
           }
           else Khaibaolandau(mucdich);
       }
       else if (mucdich == "Khai báo thay đổi nơi làm việc") Khaibaothaydoinoilamviec(mucdich);
       else if (mucdich == "Khai báo thay đổi số điện thoại") Khaibaothaydoisodienthoai(mucdich);
       else if (mucdich == "Khai báo lần cuối để hồi hương") Khaibaolancuoidehoihuong(mucdich);
    }

    
}