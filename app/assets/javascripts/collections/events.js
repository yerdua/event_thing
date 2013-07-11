Project2.Collections.Events = Backbone.Collection.extend({
  initialize: function (model, options){
    if (options) {
      this.parent = options.parent;
      this.parentId = options.parentId;
    }
  },
  
  model: Project2.Models.Event,
  url: function () {
    
    if (this.parent && this.parentId) {
      return '/api/' + this.parent + "/" + this.parentId + "/events";
    } else {
      return '/api/events';
    }
  }
});
