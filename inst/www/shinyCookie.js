shinyCookie = (function(){
  var exports = {};

  var namespace;
  var current_cookie;
  exports.timer = null;

  var timeout = 500;

  exports.getValue = Cookies.get;

  exports.printNamespace = function(){
    console.log(namespace);
    console.log('blah');
  };

  exports.init = function(ns, tm){
    console.log(namespace);
    if (namespace != null){
      throw new Error("shinyCookie cannot be initialized twice!");
    }
    namespace = ns;
    timeout = tm;
  };

  var shinyCookieBinding = new Shiny.InputBinding();

  $.extend(shinyCookieBinding, {
    find: function(scope) {
      console.log('firing find');
      var found = $.find(".shiny-cookie");
      console.log('found ' + JSON.stringify(found));
      return found;
    },
    initialize: function(el) {
      console.log('initialize!');
    },
  //  getType: function(){
  //    console.log('get type');
  //    return "shinyCookie";
  //  },
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

  return exports;
})();

