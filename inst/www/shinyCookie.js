shinycookie = (function(){
  var exports = {};

  var current_cookie;
  exports.timer = null;

  var timeout = 500;

  exports.getValue = Cookies.get;


  exports.init = function(ns, tm){
    timeout = tm;
    namespace = ns;
  };

  var shinycookieBinding = new Shiny.InputBinding();

  $.extend(shinycookieBinding, {
    find: function(scope) {
      console.log('firing find');
      var found = $.find(".shiny-cookie");
      console.log('found ' + JSON.stringify(found));
      return found;
    },
    initialize: function(el) {
      console.log('initialize!');
    },
    getValue: function(el) {
      console.log('get value');
      current_cookie = Cookies.get();
      return current_cookie;
    },
    setValue: function(el, value) {
      //TODO
    },
    subscribe: function(el, callback) {
      console.log('subscribing');

      exports.timer = setInterval(function() {
        console.log("timer fires");
        if (JSON.stringify(current_cookie) !== JSON.stringify(Cookies.get())) {
          console.log('different!');
          callback();
        }
      }, timeout);
    }, unsubscribe: function(el) {
      console.log('unsubscribing');
      clearInterval(exports.timer);
    }
  });

  Shiny.inputBindings.register(shinycookieBinding, "shinycookieBinding");

  Shiny.addCustomMessageHandler('shinycookie', function(data) {
    $.each(data, function(key, val){
      if (typeof(val) !== 'string'){
        // If it's not a raw string, JSON.stringify
        val = JSON.stringify(val);
      }
      Cookies.set(key, val, {expires: 7, path: ''});
    });
  });

  return exports;
})();

