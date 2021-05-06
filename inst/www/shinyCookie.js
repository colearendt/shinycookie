shinyCookie = (function(){
  var exports = {};

  var current_cookie;
  exports.timer = null;

  var timeout = 500;

  exports.getValue = Cookies.getJSON;


  exports.init = function(tm){
    timeout = tm;
  };

  var shinyCookieBinding = new Shiny.InputBinding();

  $.extend(shinyCookieBinding, {
    find: function(scope) {
      var found = $.find(".shiny-cookie");
      return found;
    },
    initialize: function(el) {
      console.log('initialize!');
    },
    getValue: function(el) {
      //console.log('get value');
      current_cookie = Cookies.getJSON();
      return current_cookie;
    },
    setValue: function(el, value) {
      //TODO
    },
    subscribe: function(el, callback) {
      exports.timer = setInterval(function() {
        if (JSON.stringify(current_cookie) !== JSON.stringify(Cookies.getJSON())) {
          callback();
        }
      }, timeout);
    }, unsubscribe: function(el) {
      clearInterval(exports.timer);
    }
  });

  Shiny.inputBindings.register(shinyCookieBinding, "shinyCookieBinding");

  Shiny.addCustomMessageHandler('shinyCookie', function(data) {
    $.each(data, function(key, val){
      if (typeof(val) !== 'string'){
        // If it's not a raw string, JSON.stringify
        val = JSON.stringify(val);
      }
      Cookies.set(key, val, {expires: 7, path: ''});
    });
  });

  Shiny.addCustomMessageHandler('shinyCookieRemove', function(data) {
    cookie_name = data.name;
    delete data.name;
    Cookies.remove(cookie_name, data);
  });

  return exports;
})();

