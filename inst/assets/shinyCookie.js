shinyCookie = (function(){
  var exports = {};

  var namespace;

  exports.getValue = function(key){
    Cookies.get(key);
  };

  exports.init = function(ns){
    if (namespace !== null){
      throw new Error("shinyCookie cannot be initialized twice!");
    }
    namespace = ns;
  };

  var shinyCookieBinding = new Shiny.InputBinding();

  $.extend(shinyCookieBinding, {
    find: function(scope) {
      return $(scope).find(".shiny-cookie");
    },
    getType: function(){
      return "shinyCookie";
    },
    getValue: function(el) {
      return Cookies.get();
    },
    setValue: function(el, value) {
      //TODO
    },
    subscribe: function(el, callback) {
      $(el).on("change.shinyCookieBinding", function(e) {
        callback();
      });
    }, unsubscribe: function(el) {
      $(el).off(".shinyCookieBinding");
    }
  });

  Shiny.inputBindings.register(shinyCookieBinding);

  Shiny.addCustomMessageHandler('shinyCookie', function(data) {
    $.each(data, function(key, val){
      if (typeof(val) !== 'string'){
        // If it's not a raw string, JSON.stringify
        val = JSON.stringify(val);
      }
      Cookies.set(key, val, {expires: 7, path: namespace});
    });
  });

  return exports;
})();

