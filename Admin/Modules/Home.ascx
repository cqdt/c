<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Home.ascx.cs" Inherits="Admin_Modules_Home" %>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td valign="top">
			<table width="100%" border="0" cellspacing="2" cellpadding="2">
				<tr>
					<td>
						Xin chào: <span class="welcome"><%= UserName %></span></td>
				</tr>
				<tr>
					<td>
						<table width="100%" border="0" cellspacing="1" cellpadding="1" class="table_box">
							<tr>
								<td align="left" class="bg_box">
									Các chức năng
								</td>
							</tr>
							<tr>
								<td>
									<table width="100%" border="0" cellspacing="1" cellpadding="1">
										<tr>
											<td align="center">
												<div class="cpanel">
													<div style="float: left;">
														<div class="icon">
															<a href="Default.aspx?ctl=Menus">
																<img src="images/admin_28.png" alt="" width="58" height="58" border="0" />
																<span>Danh mục tin </span></a>
														</div>
													</div>
													<div style="float: left;">
														<div class="icon">
															<a href="Default.aspx?ctl=Articles">
																<img src="images/admin_30.png" alt="" width="58" height="58" border="0" />
																<span>Quản lý tin tức</span> </a>
														</div>
													</div>
													
												  <div style="float: left;">
														<div class="icon">
															<a href="Default.aspx?ctl=FeedBacks">
																<img src="images/admin_54.png" alt="" width="58" height="58" border="0" />
																<span>Li&#234;n hệ</span></a></div>
													</div>
													<div style="float: left;">
														<div class="icon">
															<a href="Default.aspx?ctl=Users">
																<img src="images/admin_56.png" alt="" width="58" height="58" border="0" />
																<span>Quản lý người dùng </span></a>
														</div>
													</div>
													<div style="float: left;">
														<div class="icon">
															<a href="Default.aspx?ctl=Config">
																<img src="images/admin_57.png" alt="" width="58" height="58" border="0" />
																<span>Cấu hình hệ thống</span> </a>
														</div>
													</div>													
													
												</div>
											</td>
										</tr>
																		
										
										
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>		
	</tr>
	<tr>
		<td height="5" colspan="2" style="border-bottom: 1px solid #b0bec7;">
			<img src="images/spacer.gif" width="1" height="1" /></td>
	</tr>
</table>
