App.FlagView = Ember.View.extend({
  country: null,
  tagName: 'img',
  attributeBindings: ['src', 'style'],
  style: "opacity:0.3;height:36px;",
  src: function() {
    if ( this.get('country.name') ) {
      return "/img/country-flag-icons/" + this.get('country.name').replace(/ /g, "-") + "-Flag.png";
    }
  }.property('country.name')
});

