Ember.Handlebars.helper('translate', function(value, options) {
  if ( !!!value ) { return ''; }
  var context = options.contexts[0];
  var namespace = Ember.get(context.namespace.toString());
  var router = context.target.router;
  var currentRoute = router.currentHandlerInfos[router.currentHandlerInfos.length - 1].name;
  var translations = Ember.get(namespace, 'translations');
  var fullKey = currentRoute + "." + value;
  return Ember.get(translations, fullKey) || ("missing translation: '" + fullKey + "'");
});
