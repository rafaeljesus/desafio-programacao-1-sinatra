App.Routers.UserSessions = Backbone.Router.extend({

  initialize: function(options) {
    this.el = document.querySelector('#container');
    this.currentUser = options.currentUser;
  },

  routes: {
    '': 'new',
    'sessions/destroy': 'destroy'
  },

  new: function() {
    var options = { currentUser: this.currentUser, el: this.el }
    var view = new App.Views.UserSession(options);
    view.render();
  },

  destroy: function() {
    var options = { currentUser: this.currentUser }
    var view = new App.Views.UserSessionsDestroy(options);
    view.destroy();
  }

});
