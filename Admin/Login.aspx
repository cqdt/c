<%@ Page Language="C#" AutoEventWireup="true" Inherits="CMS.TTV.Admin.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>Login</title>
	<link href="Styles/Styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<form id="form1" runat="server">
		<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" class="border">
			<tr>
				<td>
					<img src="images/banner.jpg" width="780" height="88" alt="" /></td>
			</tr>
			<tr>
				<td height="29" background="images/bg_menu.jpg" class="border_menu">
				
				</td>
			</tr>
			<tr>
				<td>
					<div id="ctr" align="center">
						<div class="login">
							<div class="login-form">
								<table width="100%" border="0" cellspacing="1" cellpadding="1">
									<tr>
										<td width="35">
											<img src="images/security.png" height="35" width="35" /></td>
										<td class="welcome">
											Đăng Nhập</td>
									</tr>
								</table>
								<div class="form-block">
									<div class="inputlabel">
										Tên đăng nhập</div>
									<div>
										<asp:TextBox ID="txtUser" CssClass="inputbox" Width="220px" runat="server"></asp:TextBox>
										<asp:RequiredFieldValidator ID="rfvUser" runat="server" ErrorMessage="Bạn chưa nhập tên đăng nhập"
											ControlToValidate="txtUser" ValidationGroup="G1" Display="Dynamic">*</asp:RequiredFieldValidator>
									</div>
									<div class="inputlabel">
										Mật khẩu</div>
									<div>
										<asp:TextBox ID="txtPass" CssClass="inputbox" Width="220px" TextMode="Password" runat="server"></asp:TextBox>
										<asp:RequiredFieldValidator ID="rfvPass" runat="server" ErrorMessage="Bạn chưa nhập mật khẩu"
											ControlToValidate="txtPass" ValidationGroup="G1" Display="Dynamic">*</asp:RequiredFieldValidator>
									</div>
									<div align="center">
										<asp:Button ID="btnLogin" CssClass="button" ValidationGroup="G1" runat="server" Text="Đăng nhập"
											OnClick="btnLogin_Click" />
										<input id="btnCancel" class="Button" type="reset" value="Nhập lại" />
									</div>
								</div>
							</div>
							<div align="center">
								<br />
								<asp:LinkButton ID="lbtnForgotPass" runat="server" CssClass="Link" OnClick="lbtnForgotPass_Click"><b>Quên mật khẩu</b></asp:LinkButton>
								<br />
								<br />
								<asp:Panel ID="pnForgotPass" runat="server" Height="28px" Width="258px">
									Email :
									<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
									<asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
										ErrorMessage="Bạn chưa nhập email" SetFocusOnError="True" ValidationGroup="G2"
										Display="Dynamic">*</asp:RequiredFieldValidator>
									<asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
										ErrorMessage="Email bạn nhập không đúng định dạng" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
										ValidationGroup="G2" Display="Dynamic">*</asp:RegularExpressionValidator>
									<asp:Button ID="btnForgotPass" ValidationGroup="G2" runat="server" Text="Gửi" OnClick="btnForgotPass_Click" />
								</asp:Panel>
							</div>
							<div class="clr">
							</div>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td height="47" align="center">
					&nbsp;</td>
			</tr>
			<tr>
				<td height="47" align="center" background="images/footer.jpg">
					  © Coppyright 20098, by <a href="#"> Colab </a> All rights reserved. 
				</td>
			</tr>
		</table>
		<asp:ValidationSummary ID="vsLogin" ValidationGroup="G1" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="True" />
		<asp:ValidationSummary ID="vsForgotPass" ValidationGroup="G2" ShowSummary="false" HeaderText="Vui lòng kiểm tra lại :" runat="server" ShowMessageBox="True" />
	</form>
</body>
</html>
