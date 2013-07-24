Ember.Handlebars.registerHelper('pluralize', function(key, string, options) {
  var value = Ember.get(options.data.view.templateData.keywords, key);
  if ( value === 1 ) {
    return value + ' ' + string;
  } else {
    return value + ' ' + string + 's';
  }
});
