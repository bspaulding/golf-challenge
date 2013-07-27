App.FlagView = Ember.View.extend({
  country: null,
  tagName: 'img',
  attributeBindings: ['src'],
  classNames: ['flag'],
  src: function() {
    if ( this.get('country.name') ) {
      return "/img/country-flag-icons/" + this.get('country.name').replace(/ /g, "-") + "-Flag.png";
    }
  }.property('country.name')
});

Ember.Handlebars.helper('flag', App.FlagView);
