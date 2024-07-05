<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.parallax {
	background-image: url("pages-front/img/job/bg.jpg");
}
</style>
<div class="parallax show-on-scroll">
	<div class="detail" data-aos="zoom-in" data-aos-duration="800">
		<c:forEach var="job" items="${job}">
			<h4>
				<font color="#BD2125">Job Ref : ${job.name}</font>
				<h4>
					<br>
					<h2>
						<font color="#BD2125"><b>${job.position}</b></font>
					</h2>
					${job.description}
		</c:forEach>
		<div align="right">
			<br> <br>
			<p>For interested person, you can contact</p>
			<p>Tel : 091 557 7578</p>
			<p>
				E-Mail : <a href="/cdn-cgi/l/email-protection" class="__cf_email__"
					data-cfemail="f9918bb99a8c9b9c8a969f8d8d9c9a91d79a9694">hr@cubesofttech.com</a>
			</p>
		</div>
		<br>
		<div align="center">
			<button type="button" class="btn btn-danger" data-toggle="modal"
				data-target="#exampleModal">
				Apply &nbsp <img src="pages-front/img/job/icon2.png" height="30px">
			</button>
		</div><br>
	</div>
	<br>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Send Email and Resume</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		            <span aria-hidden="true">&times;</span>
		        </button>
			</div>
			<form action="sendEmailJob" enctype="multipart/form-data" name="frmAdd" method="post">
				<div class="modal-body">
					<div class="form-group">
						Name:<input type="text" class="form-control" placeholder="Enter Name" name ="contactName"><br>
						E-mail:<input type="email" class="form-control" placeholder="Enter E-mail" name = "contactEmail"><br>
						Telephone:<input type="text" class="form-control" placeholder="Enter Telephone" name = "contactTel"><br>
						Position:<input type="text" class="form-control" placeholder="Enter Position" value="Java Programmer" name="contactPosition" disable><br>
						Attach Resume: <div class="custom-file">
							<input type="file" class="custom-file-input" name="file" id="file" value="Select" size="37" onchange="dotfile.value=this.value; return true;">
							<label class="custom-file-label" for="customFile">Choose file</label>
						</div><br>			
						Message:<textarea rows="4" cols="50" class="form-control" name = "contactMessage">
							</textarea>						
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-danger" value = "submit">Save changes</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script>
	AOS.init();
	$(".custom-file-input").on("change", function() {
		var fileName = $(this).val().split("\\").pop();
		$(this).siblings(".custom-file-label").addClass("selected").html(fileName);
	});
</script>