shinyCookie = (function(){
  var exports = {};

  var namespace;

  exports.getValue = Cookies.get;

  exports.printNamespace = function(){
    console.log(namespace);
    console.log('blah');
  };

  exports.init = function(ns){
    console.log(namespace);
    if (namespace != null){
      throw new Error("shinyCookie cannot be initialized twice!");
    }
    namespace = ns;
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
      console.log('firing!');
    },
  //  getType: function(){
  //    console.log('get type');
  //    return "shinyCookie";
  //  },
    getValue: function(el) {
      console.log('get value');
      return Cookies.get();
    },
    setValue: function(el, value) {
      //TODO
    },
    subscribe: function(el, callback) {
      console.log('subscribing');
      $(el).on("change.shinyCookieBinding", function(e) {
        callback();
      });
    }, unsubscribe: function(el) {
      console.log('unsubscribing');
      $(el).off(".shinyCookieBinding");
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

