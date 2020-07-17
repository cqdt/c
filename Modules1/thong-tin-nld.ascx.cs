using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class Modules_thong_tin_nld : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string itv = CMS.TTV.Web.Utils.GetStringFromQueryString("itv", "");
        if (itv == "")
        {
            Random rd = new Random();
            string random = Convert.ToString(rd.Next(11111111, 99999999));
            //txtMatimviec.Text = "TV" + random;
            //btndangky.Enabled = true;
            //btndangkytiep.Enabled = false;

        }
        else
        {
            //txtMatimviec.Text = itv;
            //btndangky.Enabled = false;
            //btndangkytiep.Enabled = true;
            Binddata(itv);

        }
        BindNganhnghe();
        BindVitri();
    }



    public void BindVitri()
    {
        string sql = "select C_MAVT,C_VITRI from T_DM_VITRI  order by C_MAVT";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            cbovitri.DataSource = dtNews;
            cbovitri.DataTextField = "C_VITRI";
            cbovitri.DataValueField = "C_MAVT";
            cbovitri.DataBind();
        }

    }

    public void BindNganhnghe()
    {
        string sql = "SELECT * from T_DM_NGHE ORDER BY C_MA";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            cboNganhngheduocdaotao1.DataSource = dtNews;
            cboNganhngheduocdaotao1.DataTextField = "C_NGHE";
            cboNganhngheduocdaotao1.DataValueField = "C_MA";
            cboNganhngheduocdaotao1.DataBind();

            cboNganhnghelamviectainuocngoai1.DataSource = dtNews;
            cboNganhnghelamviectainuocngoai1.DataTextField = "C_NGHE";
            cboNganhnghelamviectainuocngoai1.DataValueField = "C_MA";
            cboNganhnghelamviectainuocngoai1.DataBind();


            cboNganhngheduocdaotao2.DataSource = dtNews;
            cboNganhngheduocdaotao2.DataTextField = "C_NGHE";
            cboNganhngheduocdaotao2.DataValueField = "C_MA";
            cboNganhngheduocdaotao2.DataBind();

            cboNganhnghelamviectainuocngoai2.DataSource = dtNews;
            cboNganhnghelamviectainuocngoai2.DataTextField = "C_NGHE";
            cboNganhnghelamviectainuocngoai2.DataValueField = "C_MA";
            cboNganhnghelamviectainuocngoai2.DataBind();

            cboNganhngheduocdaotao3.DataSource = dtNews;
            cboNganhngheduocdaotao3.DataTextField = "C_NGHE";
            cboNganhngheduocdaotao3.DataValueField = "C_MA";
            cboNganhngheduocdaotao3.DataBind();

            cboNganhnghelamviectainuocngoai3.DataSource = dtNews;
            cboNganhnghelamviectainuocngoai3.DataTextField = "C_NGHE";
            cboNganhnghelamviectainuocngoai3.DataValueField = "C_MA";
            cboNganhnghelamviectainuocngoai3.DataBind();


            cboNganhnghedukientimviec.DataSource = dtNews;
            cboNganhnghedukientimviec.DataTextField = "C_NGHE";
            cboNganhnghedukientimviec.DataValueField = "C_MA";
            cboNganhnghedukientimviec.DataBind();

        }
    }

    public void Binddata(string itv)
    {
        string sql = "select * from T_NGUOILAODONG where C_MATIMVIEC='" + itv + "'";
        DataTable dtNews = CMS.SqlCache.FillDataTable(sql);
        if (dtNews.Rows.Count > 0)
        {
            txthodem.Text = dtNews.Rows[0]["C_HODEM"].ToString();
            txtten.Text = dtNews.Rows[0]["C_TEN"].ToString();
            dpngaysinh.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_NGAYSINH"].ToString());
            cboGioitinh.Value = dtNews.Rows[0]["C_GIOITINH"].ToString();
            txtCMND.Text = dtNews.Rows[0]["C_CMND"].ToString();
            txtDiachi.Text = dtNews.Rows[0]["C_NOICUTRU"].ToString();

            txtHuyen.Text = dtNews.Rows[0]["C_HUYEN"].ToString();
            cboTinh.Value = dtNews.Rows[0]["C_TINH"].ToString();
            cboChuongtrinhthamgia.Value = dtNews.Rows[0]["C_CHUONGTRINH"].ToString();
            txtIDnuocngoai.Text = dtNews.Rows[0]["C_SOID"].ToString();
            dpNgayxuatcanh.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_NGAYXUATCANH"].ToString());

            dpNgayvenuoc.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_NGAYVENUOC"].ToString());
           // txtDienthoai.Text = dtNews.Rows[0]["C_DIENTHOAI"].ToString();
           // txtEmail.Text = dtNews.Rows[0]["C_EMAIL"].ToString();
            cboNgoaingu.Value = dtNews.Rows[0]["C_NGOAINGU"].ToString();
            cboChungchi.Value = dtNews.Rows[0]["C_CHUNGCHI"].ToString();

            cboNganhngheduocdaotao1.SelectedValue = dtNews.Rows[0]["C_DAOTAONGHE1"].ToString();
            dpDaotaotu1.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_DAOTAOTU1"].ToString());
            dpDaotaoden1.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_DAOTAODEN1"].ToString());
            cboBangcap1.Value = dtNews.Rows[0]["C_BANGCAP1"].ToString();
            txtBangcapkhac1.Text = dtNews.Rows[0]["C_BANGCAPKHAC1"].ToString();
            cboNganhnghelamviectainuocngoai1.SelectedValue = dtNews.Rows[0]["C_NGHELAMVIEC1"].ToString();
            txtCongvieccuthe1.Text = dtNews.Rows[0]["C_CVCUTHE1"].ToString();
            dpCVcuthetu1.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_CVCUTHETU1"].ToString());
            dpCVcutheden1.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_CVCUTHEDEN1"].ToString());


            cboNganhngheduocdaotao2.SelectedValue = dtNews.Rows[0]["C_DAOTAONGHE2"].ToString();
            dpDaotaotu2.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_DAOTAOTU2"].ToString());
            dpDaotaoden2.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_DAOTAODEN2"].ToString());
            cboBangcap2.Value = dtNews.Rows[0]["C_BANGCAP2"].ToString();
            txtBangcapkhac2.Text = dtNews.Rows[0]["C_BANGCAPKHAC2"].ToString();
            cboNganhnghelamviectainuocngoai2.SelectedValue = dtNews.Rows[0]["C_NGHELAMVIEC2"].ToString();
            txtCongvieccuthe2.Text = dtNews.Rows[0]["C_CVCUTHE2"].ToString();
            dpCVcuthetu2.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_CVCUTHETU2"].ToString());
            dpCVcutheden2.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_CVCUTHEDEN2"].ToString());

            cboNganhngheduocdaotao3.SelectedValue = dtNews.Rows[0]["C_DAOTAONGHE3"].ToString();
            dpDaotaotu3.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_DAOTAOTU3"].ToString());
            dpDaotaoden3.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_DAOTAODEN3"].ToString());
            cboBangcap3.Value = dtNews.Rows[0]["C_BANGCAP3"].ToString();
            txtBangcapkhac3.Text = dtNews.Rows[0]["C_BANGCAPKHAC3"].ToString();
            cboNganhnghelamviectainuocngoai3.SelectedValue = dtNews.Rows[0]["C_NGHELAMVIEC3"].ToString();
            txtCongvieccuthe3.Text = dtNews.Rows[0]["C_CVCUTHE3"].ToString();
            dpCVcuthetu3.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_CVCUTHETU3"].ToString());
            dpCVcutheden3.SelectedDate = DateTime.Parse(dtNews.Rows[0]["C_CVCUTHEDEN3"].ToString());

            cboNganhnghedukientimviec.SelectedValue = dtNews.Rows[0]["C_NGANHNGHEDUKIENTIM"].ToString();
            cbovitri.SelectedValue = dtNews.Rows[0]["C_VITRIMONGMUON"].ToString();
            choMucluongmongmuon.Value = dtNews.Rows[0]["C_MUCLUONGMONGMUON"].ToString();
            cboDiadiemlamviecmongmuon.Value = dtNews.Rows[0]["C_DIADIEMMONGMUON"].ToString();


            DisableTxT();

        }
    }

    public void DisableTxT()
    {
        txthodem.Enabled = false;
        txtten.Enabled = false;
        dpngaysinh.Enabled = false;
        cboGioitinh.Disabled = true;
        txtCMND.Enabled = false;
        txtDiachi.Enabled = false;

        txtHuyen.Enabled = false;
        cboTinh.Disabled = true;
        cboChuongtrinhthamgia.Disabled = true;
        txtIDnuocngoai.Enabled = false;
        dpNgayxuatcanh.Enabled = false;

        dpNgayvenuoc.Enabled = false;
        txtDienthoai.Enabled = false;
        txtEmail.Enabled = false;
        cboNgoaingu.Disabled = true;
        cboChungchi.Disabled = true;

        cboNganhngheduocdaotao1.Enabled = false;
        dpDaotaotu1.Enabled = false;
        dpDaotaoden1.Enabled = false;
        cboBangcap1.Disabled = true;
        txtBangcapkhac1.Enabled = false;
        cboNganhnghelamviectainuocngoai1.Enabled = false;
        txtCongvieccuthe1.Enabled = false;
        dpCVcuthetu1.Enabled = false;
        dpCVcutheden1.Enabled = false;

        cboNganhngheduocdaotao2.Enabled = false;
        dpDaotaotu2.Enabled = false;
        dpDaotaoden2.Enabled = false;
        cboBangcap2.Disabled = true;
        txtBangcapkhac2.Enabled = false;
        cboNganhnghelamviectainuocngoai2.Enabled = false;
        txtCongvieccuthe2.Enabled = false;
        dpCVcuthetu2.Enabled = false;
        dpCVcutheden2.Enabled = false;

        cboNganhngheduocdaotao3.Enabled = false;
        dpDaotaotu3.Enabled = false;
        dpDaotaoden3.Enabled = false;
        cboBangcap3.Disabled = true;
        txtBangcapkhac3.Enabled = false;
        cboNganhnghelamviectainuocngoai3.Enabled = false;
        txtCongvieccuthe3.Enabled = false;
        dpCVcuthetu3.Enabled = false;
        dpCVcutheden3.Enabled = false;

        cboNganhnghedukientimviec.Enabled = false;
        cbovitri.Enabled = false;
        choMucluongmongmuon.Disabled = true;
        cboDiadiemlamviecmongmuon.Disabled = true;

        //btndangky.Enabled = false;
    }
}