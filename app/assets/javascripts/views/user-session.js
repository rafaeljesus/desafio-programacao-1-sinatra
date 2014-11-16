App.Views.UserSession = Backbone.View.extend({

  template: _.template($('#signup').html()),

  initialize: function(options) {
    _.bindAll(this, 'render');
    this.currentUser = options.currentUser;
    this.model = new App.Models.UserSession();
  },

  render: function() {
    this.$el.html(this.template());
    return this;
  },

  events: {
    'click .github': 'authenticate'
  },

  authenticate: function(e) {
    e.preventDefault();
    var options = this.oauthParams(e.target.href);
    new OmniauthConnect(options).exec();
  },

  oauthParams: function(url) {
    return {
      view: this,
      url: url,
      provider: 'github',
      authenticatedCallback: this.authenticatedCallback
    }
  },

  authenticatedCallback: function(view, attrs) {
    view.currentUser.set(attrs);
    if (!attrs) return;
    var message = 'You Successfully Signed Up';
    view.successMessage(message);
  }

});
