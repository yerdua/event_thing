Project2.Models.User = Backbone.RelationalModel.extend({
  relations: [{
    type: Backbone.HasMany,
    key: 'events',
    relatedModel: 'Project2.Models.Event',
    collectionType: 'Project2.Collections.Events',
    collectionOptions: function (model) {
      options = {
        parent: 'users',
        parentId: model.id
      };
      return options;
    }
  }],
  
  url: function () {
    if (this.id) {
      return '/api/users/' + this.id;
    } else {
      return '/api/users'
    }  
  },
  
  urlRoot: '/api/users'
});
