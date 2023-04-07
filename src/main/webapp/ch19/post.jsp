<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="ch19.*"%>
<jsp:useBean id="pmgr" class="ch19.PBlogMgr" />
<%
	String id = (String) session.getAttribute("idKey");
	if (id == null)
		response.sendRedirect("login.jsp");
	PMemberBean mbean = pmgr.getPMember(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>PhotoBlog</title>
<%@include file="js_css.html"%>
<script type="text/javascript">
	function send() {
		document.frm.submit();
	}
	function goURL(url) {
		document.frm1.action = url;
		document.frm1.submit();
	}
</script>
</head>
<body>
	<div data-role="page" align="center">
		<div data-role="header">
			<table>
				<tr>
					<td align="left" width="200">
						<h1 style="font-family: fantasy;" align="left">PhotoBlog</h1>
					</td>
					<td><a style="font-size: 40px;"
						href="javascript:goURL('home.jsp','')">H</a> <a
						style="font-size: 40px;" href="javascript:goURL('post.jsp','')">P</a>
					</td>
					<td>
						<div class="box" style="background: #BDBDBD;">
							<img class="profile" src="photo/<%=mbean.getProfile()%>" width="30"
								height="30" onclick="location='logout.jsp'">
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div data-role="content">
			<form method="post" name="frm" action="pBlogPost"
				enctype="multipart/form-data" class="post_form">
				<div class="preview">
					<div class="upload">
						<div class="post_btn">
							<div class="plus_icon"></div>
							<p>포스트 이미지 추가</p>
							<canvas id="imageCanvas"></canvas>
						</div>
					</div>
				</div>
				<p>
					<input type="file" name="photo" id="id_photo" required="required">
				</p>
				<p>
					<textarea name="message" cols="50" rows="5"
						placeholder="message 등록해 주세요."></textarea>
				</p>
				<input type="hidden" value="<%=id%>" name="id"> 
				<input type="button" value="저장" onclick="send()">
			</form>
		</div>
		<form method="post" name="frm1"></form>
		<%@include file="footer.jsp"%>
	</div>
	<script>
		var fileInput = document.querySelector("#id_photo"), button = document
				.querySelector(".input-file-trigger"), the_return = document
				.querySelector(".file-return");
		// Show image
		fileInput.addEventListener('change', handleImage, false);
		var canvas = document.getElementById('imageCanvas');
		var ctx = canvas.getContext('2d');

		function handleImage(e) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = new Image();
				img.onload = function() {
					canvas.width = 300;
					canvas.height = 300;
					ctx.drawImage(img, 0, 0, 300, 300);
				};
				img.src = event.target.result;
			};
			reader.readAsDataURL(e.target.files[0]);
		}
	</script>
</body>
</html>