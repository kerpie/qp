// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require_directory ./template
//= require jquery_ujs
//= require_directory .

$("#start_session").on('shown', function(){
	$("#user_email").focus();
});

$(".close").click(function(){
	$(this).parents(".system_message").hide();
});

if($(".system_message").html().length > 0){
	setTimeout(hideMessage, 3000);
}

function hideMessage(){
	$(".system_message").fadeOut(500);
}