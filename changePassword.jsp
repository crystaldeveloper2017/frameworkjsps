<style>
.vertiAlignMiddle
{
	vertical-align:middle!important;
}
</style>

<script>

document.getElementById("divTitle").innerHTML="Change Password";
	
function changePasswordAjax()
{	
	var oldPassword= encodeURIComponent(document.getElementById("txtoldpassword").value);
	var newPassword= encodeURIComponent(document.getElementById("txtnewpassword").value);
	var confirmnewpassword= encodeURIComponent(document.getElementById("txtconfirmnewpassword").value);
	
	
	if(confirmnewpassword!=newPassword)
		{
			alert("New password and Confirm Password should be same");
			return;	
		}
	
	
	
	
	
	var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() 
	  {
	    if (xhttp.readyState == 4 && xhttp.status == 200) 
	    { 		     
	    	 
	    	 
	    	 document.getElementById("responseText").innerHTML=xhttp.responseText;
	   	  document.getElementById("closebutton").style.display='block';
	   	  document.getElementById("loader").style.display='none';
	   	  $('#myModal').modal({backdrop: 'static', keyboard: false});;	    	 
	    
		}
	  };
	  xhttp.open("POST","?a=changePassword&oldPassword="+oldPassword+"&newPassword="+newPassword,true);    
	  xhttp.send();	
}
	
</script>

<div class="container">
	<table class="table table-bordered tablecss" border="3">

		<div class="container" style="padding:20px;background-color:white">
			<form id="frm" action="?a=addCategory" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
				<input type="hidden" name="app_id" value="${userdetails.app_id}">
				<input type="hidden" name="user_id" value="${userdetails.user_id}">
				<input type="hidden" name="callerUrl" id="callerUrl" value="">
				
				
				<div class="row">
					<div class="col-sm-12">
						<div class="form-group pass_show">      
							<label>Current Password</label> 	                 
							<input type="password" class="form-control" id="txtoldpassword" placeholder="Current Password">
							<input type="hidden" name="hdnCategoryId" value="${categoryDetails.category_id}" id="hdnCategoryId">
						</div>
					</div>	
					
					<div class="col-sm-12">
						<div class="form-group pass_show">      
							<label>New Password</label>      
							<input type="password"  class="form-control" id="txtnewpassword" placeholder="New Password"> 
						</div>
					</div>
					
					<div class="col-sm-12">
						<div class="form-group">      
							<label>Confirm Password</label>      
							<input type="password" class="form-control" id="txtconfirmnewpassword"  placeholder="Confirm Password">				    
						</div>
					</div>
					
					<button class="btn btn-success" type="button" onclick='changePasswordAjax()'>Save</button>
					<button class="btn btn-danger" type="reset" onclick='window.location="?a=showHomePage"'>Cancel</button>					
						
				</div>
			</form>		
		</div>
	</table>
</div>