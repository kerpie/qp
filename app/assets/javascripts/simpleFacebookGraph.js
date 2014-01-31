var fb = {
  config :{
  // CONFIG VARS: 
    app_id : '491036367675336', 
    use_xfbml : true,
    extendPermissions : 'email,publish_stream,user_events' , 
    // info: http://developers.facebook.com/docs/reference/api/permissions/
    locale : 'es_ES'
    // all locales in: http://www.facebook.com/translations/FacebookLocales.xml
  // END CONFIG VARS
  },
  perms : [],
  hasPerm : function (perm) { for(var i=0, l=fb.perms.length; i<l; i++) { if(fb.perms[i] == perm) {return true;}} return false; },
  logged : false,
  user : false, // when login, is a user object: http://developers.facebook.com/docs/reference/api/user
  login : function (callback){
    FB.login(function(r) {
      if (r.status == 'connected') {
      	// loading
      	//$('body').prepend('<div class="div-carga"><img src="'+$('#base_url_js').val()+'static/images/dog2.gif"/></div>');
      	$('body').css('cursor','wait');
        FB.api('/me/permissions',function(perm){
          
          fb.logged = true;
		  fb.perms = [];
		  for(i in perm.data[0])
		  {
			if (perm.data[0][i] == 1)
			{
				fb.perms.push(i);
			}
		  }
        });	   
		fb.getUser(callback);
      } else {
        fb.logged = false;
        fb.perms = [];
		callback();
      }
    },{scope:fb.config.extendPermissions});
    return false;
  },
  syncLogin : function (callback){
    if (!callback) callback = function(){};
    FB.getLoginStatus(function(r) {
      if (r.status == 'connected' ) { 
        FB.api('/me/permissions',function(perm){
          
          fb.logged = true;
		  fb.perms = [];
		  for(i in perm.data[0])
		  {
			if (perm.data[0][i] == 1)
			{
				fb.perms.push(i);
			}
		  }
        });	   
        fb.getUser(callback);
        //fb.getEvents(callback);
        return true;
      } else {
        fb.logged = false;
        callback();
        return false;
      }
    });
  },
  logout : function(callback) {FB.logout(callback);},
  getUser : function(callback){
    FB.api('/me', function(r){
      var user = r;
      //console.log(r);
      user.picture = "https://graph.facebook.com/"+user.id+"/picture";
      fb.user=user; callback(user); 
    }); 
  },
  /*getEvents : function(callback){
    FB.api('/me/events', function(r){
      var evento = r;
      //console.log(r);
      //user.picture = "https://graph.facebook.com/"+user.id+"/picture";
      fb.evento=evento; callback(evento); 
    }); 
  },*/
  publish : function (publishObj,callback,noReTry) {
  // publishObj: http://developers.facebook.com/docs/reference/api/post   
    if (fb.logged && fb.hasPerm('publish_stream'))
    { 
      FB.api('/me/feed', 'post', publishObj, function(response) {
      if (!response || response.error) {
        callback(false);
      } else {
        callback(true);
      }
      });
      return true;
    }
    else
    { 
      if (!noReTry)
      	return fb.login(function() { return fb.publish(publishObj,callback,1)});
      else
      {
        callback(false);
        return false;
      }
    }
  },
  readyFuncs : [],
  ready: function(func){fb.readyFuncs.push(func)},
  launchReadyFuncs : function () {for(var i=0,l=fb.readyFuncs.length;i<l;i++){fb.readyFuncs[i]();};}
}
window.fbAsyncInit = function() { 
  if (fb.config.app_id) FB.init({appId: fb.config.app_id, status: true, cookie: true, xfbml: fb.config.use_xfbml});
  fb.syncLogin(fb.launchReadyFuncs);
};
var oldload = window.onload;
window.onload = function() {
  var d = document.createElement('div'); d.id="fb-root"; document.getElementsByTagName('body')[0].appendChild(d);
  var e = document.createElement('script'); e.async = true; e.src = document.location.protocol + '//connect.facebook.net/'+fb.config.locale+'/all.js';
  document.getElementById('fb-root').appendChild(e);
  if (typeof oldload == 'function') oldload();
};
