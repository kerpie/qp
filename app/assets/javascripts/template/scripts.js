$(document).ready(function(){	
/***************************************************
	MENU
***************************************************/
	$("<select />").appendTo("nav#main_menu div");
	
	// Create default option "Go to..."
	$("<option />", {
	   "selected": "selected",
	   "value"   : "",
	   "text"    : "choose a page"
	}).appendTo("nav#main_menu select");	
	
	// Populate dropdowns with the first menu items
	$("nav#main_menu li a").each(function() {
	 	var el = $(this);
	 	$("<option />", {
	     	"value"   : el.attr("href"),
	    	"text"    : el.text()
	 	}).appendTo("nav#main_menu select");
	});
	
/***************************************************
	RESPONSIVE MENU
***************************************************/		
  	$("nav#main_menu select").change(function() {
    	window.location = $(this).find("option:selected").val();
  	});
	
/***************************************************
	IFRAME
***************************************************/
	$("iframe").each(function(){
		var ifr_source = $(this).attr('src');
		var wmode = "wmode=transparent";
		if(ifr_source.indexOf('?') != -1) {
		var getQString = ifr_source.split('?');
		var oldString = getQString[1];
		var newString = getQString[0];
		$(this).attr('src',newString+'?'+wmode+'&'+oldString);
		}
		else $(this).attr('src',ifr_source+'?'+wmode);
	});
			

/*************************************************************
	FLICKR  - add your id - find it here - http://idgettr.com/
**************************************************************/
	$.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?id=61498590@N03&lang=en-us&format=json&jsoncallback=?", function(data){
		$.each(data.items, function(i,item){
			if(i<=11){ // <— change this number to display more or less images
				$("<img/>").attr("src", item.media.m.replace('_m', '_s')).appendTo(".FlickrImages ul")
				.wrap("<li><a href='" + item.link + "' target='_blank' title='Flickr'></a></li>");
			}
		});			
    });	

/***************************************************
		TOOLTIP & POPOVER
***************************************************/
$("[rel=tooltip]").tooltip();
$("[data-rel=tooltip]").tooltip();
$("[data-rel=popover]").hover(function(){
	$(this).popover('toggle');
	});
	
/***************************************************
		PRETTYPHOTO
***************************************************/
	$("a[rel^='prettyPhoto']").prettyPhoto();
	jQuery("a[rel^='prettyPhoto'], a[rel^='lightbox']").prettyPhoto({
overlay_gallery: false,  social_tools: false,  deeplinking: false
});	
	
/***************************************************
		HOVER
***************************************************/
	$(".hover_img").live('mouseover',function(){
			var info=$(this).find("img");
			info.stop().animate({opacity:0.8},300);
		}
	);
	$(".hover_img").live('mouseout',function(){
			var info=$(this).find("img");
			info.stop().animate({opacity:1},300);
		}
	);
	
});	