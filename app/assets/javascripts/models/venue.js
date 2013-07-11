Project2.Models.Venue = Backbone.RelationalModel.extend({
  relations: [{
    type: Backbone.HasMany,
    key: 'events',
    relatedModel: 'Project2.Models.Event',
    collectionType: 'Project2.Collections.Events',
    collectionOptions: function (model) {
      options = {
        parent: 'venues',
        parentId: model.id
      };
      return options;
    }
  }],
  
  urlRoot: '/api/venues'
});
