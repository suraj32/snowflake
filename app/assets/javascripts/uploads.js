//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org

$(document).on('ready', function(){
	$(".upload_role_type").hide();
	$(".upload_track_category_type").hide();
	$(".upload_track_type").hide();
	$("#upload_select_type").change(function(){
		var fileType = $("#upload_select_type").val();
		if(fileType == "Roles")
		{
			$(".upload_role_type").hide();
			$(".upload_track_category_type").hide();
			$(".upload_track_type").hide();
		}
		else if(fileType == "Track Categories")
		{
			$.ajax({
  			url: 'uploads/get_role_types',
  			data: { type: fileType },
  			success: function(data, textStatus, jqXHR) {
    		 for(i in data){
    		 		$("#upload_role_type").append("<option>"+data[i].name+"</option>")
    		 }
  			}
			});
			$(".upload_role_type").show();
			$(".upload_track_category_type").hide();
			$(".upload_track_type").hide();
		}
		else if(fileType == "Tracks")
		{
			$.ajax({
  			url: 'uploads/get_role_types',
  			data: { type: fileType },
  			success: function(data, textStatus, jqXHR) {
    		 for(i in data){
    		 		$("#upload_role_type").append("<option>"+data[i].name+"</option>")
    		 }
  			}
			});
			$("#upload_role_type").change(function(){
				var roleType = $("#upload_role_type").val();
				$.ajax({
  				url: 'uploads/get_track_category_types',
  				data: { type: roleType },
  				success: function(data, textStatus, jqXHR) {
    		 		for(i in data){
    		 			$("#upload_track_category_type").append("<option>"+data[i].name+"</option>")
    		 		}
  				}
				});
			});
			$(".upload_role_type").show();
			$(".upload_track_category_type").show();
			$(".upload_track_type").hide();
		}
		else if(fileType == "Levels")
		{
			$.ajax({
  			url: 'uploads/get_role_types',
  			data: { type: fileType },
  			success: function(data, textStatus, jqXHR) {
    		 for(i in data){
    		 		$("#upload_role_type").append("<option>"+data[i].name+"</option>")
    		 }
  			}
			});
			var roleType = $("#upload_role_type").val();
			$("#upload_role_type").change(function(){
				$.ajax({
  				url: 'uploads/get_track_category_types',
  				data: { type: roleType },
  				success: function(data, textStatus, jqXHR) {
    		 		for(i in data){
    		 			$("#upload_track_category_type").append("<option>"+data[i].name+"</option>")
    		 		}
  				}
				});
			});
			$("#upload_track_category_type").change(function(){
				var trackCategoryType = $("#upload_track_category_type").val();
				$.ajax({
  				url: 'uploads/get_track_types',
  				data: { role_type: roleType, track_category_type: trackCategoryType },
  				success: function(data, textStatus, jqXHR) {
    		 		for(i in data){
    		 			$("#upload_track_category_type").append("<option>"+data[i].name+"</option>")
    		 		}
  				}
				});
			});
			$(".upload_role_type").show();
			$(".upload_track_category_type").show();
			$(".upload_track_type").show();
		}
	});
});