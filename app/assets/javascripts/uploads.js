//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org

$(document).on('ready', function(){
	$(".upload_role").hide();
	$(".upload_track_category").hide();
	$(".upload_track").hide();
	$("#upload_type_of_file").change(function(){
		var type_of_file = $("#upload_type_of_file").val();
		if(type_of_file == "Roles")
		{
			$(".upload_role").hide();
			$(".upload_track_category").hide();
			$(".upload_track").hide();
		}
		else if(type_of_file == "Track Categories")
		{
			$.ajax({
  			url: 'uploads/get_roles',
  			success: function(data, textStatus, jqXHR) {
    		 for(i in data){
    		 		$("#upload_role").append("<option>"+data[i].name+"</option>")
    		 }
  			}
			});
			$(".upload_role").show();
			$(".upload_track_category").hide();
			$(".upload_track").hide();
		}
		else if(type_of_file == "Tracks")
		{
			$.ajax({
  			url: 'uploads/get_roles',
  			success: function(data, textStatus, jqXHR) {
    		 for(i in data){
    		 		$("#upload_role").append("<option>"+data[i].name+"</option>")
    		 }
  			}
			});
			$("#upload_role").change(function(){
				var roleType = $("#upload_role").val();
				$.ajax({
  				url: 'uploads/get_track_categories',
  				data: { type: roleType },
  				success: function(data, textStatus, jqXHR) {
    		 		for(i in data){
    		 			$("#upload_track_category").append("<option>"+data[i].name+"</option>")
    		 		}
  				}
				});
			});
			$(".upload_role").show();
			$(".upload_track_category").show();
			$(".upload_track").hide();
		}
		else if(type_of_file == "Levels")
		{
			$.ajax({
  			url: 'uploads/get_roles',
  			success: function(data, textStatus, jqXHR) {
    		 for(i in data){
    		 		$("#upload_role").append("<option>"+data[i].name+"</option>")
    		 }
  			}
			});
			$("#upload_role").change(function(){
				var roleType = $("#upload_role").val();
				$.ajax({
  				url: 'uploads/get_track_categories',
  				data: { type: roleType },
  				success: function(data, textStatus, jqXHR) {
    		 		for(i in data){
    		 			$("#upload_track_category").append("<option>"+data[i].name+"</option>")
    		 		}
  				}
				});
			});
			$("#upload_track_category").change(function(){
				var roleType = $("#upload_role").val();
				var trackCategoryType = $("#upload_track_category").val();
				$.ajax({
  				url: 'uploads/get_tracks',
  				data: { role_type: roleType, track_category_type: trackCategoryType },
  				success: function(data, textStatus, jqXHR) {
    		 		for(i in data){
    		 			$("#upload_track").append("<option>"+data[i].name+"</option>")
    		 		}
  				}
				});
			});
			$(".upload_role").show();
			$(".upload_track_category").show();
			$(".upload_track").show();
		}
	});
});