Project2.Collections.Events = Backbone.Collection.extend({
  initialize: function (model, options){
    if (options) {
      this.parent = options.parent;
      this.parentId = options.parentId;
    }
    console.log('should be initializing');
  },
  
  model: Project2.Models.Event,
  url: function () {
    if (this.parent && this.parentId) {
      return '/api/' + this.get('parent') + "/" + this.get('parentId') + "/events";
    } else {
      return '/api/events';
    }
  }
});
