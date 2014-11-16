App.Models.CurrentUser = Backbone.Model.extend({
  urlRoot: 'current_user',

  initialize: function() {
    this.on('change', this.setSession, this);
    this.attributes = this.getSession();
  },

  defaults: {
    signed_in: false
  },

  setSession: function() {
    sessionStorage.setItem('currentUser', JSON.stringify(this.toJSON()));
  },

  getSession: function() {
    return JSON.parse(sessionStorage.getItem('currentUser')) || {};
  },

  removeSession: function() {
    sessionStorage.removeItem('currentUser');
  },

  signedIn: function() {
    return this.get('signed_in');
  }

});
