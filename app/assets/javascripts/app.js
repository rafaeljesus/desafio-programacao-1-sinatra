var App = new (Backbone.View.extend({

  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  init: function() {

    var currentUser = new App.Models.CurrentUser();
    if (!currentUser.signedIn()) {
      currentUser.fetch()
    }
    var options = { currentUser: currentUser }
    new App.Routers.UserSessions(options);
    // new App.Routers.Upload(options);
    new App.start();
  },

  start: function() {
    if (!Backbone.history.started) {
      Backbone.history.start();
      Backbone.history.started = true;
    }
  }

}))({ el: document.body });

$(function() {
  App.init();
});
