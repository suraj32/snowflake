//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org

$(document).on('ready', function(){
	$(".upload_role").hide();
	$(".upload_track_category").hide();
	$(".upload_track").hide();
	$("#upload_type_of_file").change(function(){
		var type_of_file = $("#upload_type_of_file").val();
		if( type_of_file == "Roles" || type_of_file == "Track Categories" || type_of_file == "Tracks" || type_of_file == "Levels" )
		{
			$(".upload_role").hide();
			$(".upload_track_category").hide();
			$(".upload_track").hide();
		}
		if( type_of_file == "Track Categories" || type_of_file == "Tracks" || type_of_file == "Levels" )
		{
			$.ajax({
  			url: 'uploads/get_roles',
  			success: function(data, textStatus, jqXHR) {
    		  for(i in data){
    		 		$("#upload_role").append("<option value="+data[i]._id.$oid+">"+data[i].name+"</option>")
    		 }
  			}
			});
			$(".upload_role").show();
		}
		if( type_of_file == "Tracks" || type_of_file == "Levels" )
		{
			$("#upload_role").change(function(){
				var role_id = $("#upload_role").val();
				$.ajax({
  				url: 'uploads/get_track_categories',
  				data: { id: role_id },
  				success: function(data, textStatus, jqXHR) {
    		 		for(i in data){
    		 			$("#upload_track_category").append("<option value="+data[i]._id.$oid+">"+data[i].name+"</option>")
    		 		}
  				}
				});
			});
			$(".upload_track_category").show();
		}
		if( type_of_file == "Levels" )
		{
			$("#upload_track_category").change(function(){
				var track_category_id = $("#upload_track_category").val();
				$.ajax({
  				url: 'uploads/get_tracks',
  				data: { id: track_category_id },
  				success: function(data, textStatus, jqXHR) {
    		 		for(i in data){
    		 			$("#upload_track").append("<option value="+data[i]._id.$oid+">"+data[i].name+"</option>")
    		 		}
  				}
				});
			});
			$(".upload_track").show();
		}
	});
});