Project2.Models.Event = Backbone.RelationalModel.extend({
  relations: [{
    type: 'HasOne',
    key: 'owner',
    relatedModel: 'Project2.Models.User'
  },{
    type: 'HasOne',
    key: 'venue',
    relatedModel: 'Project2.Models.Venue',
  }],
  
  urlRoot: '/api/events'
});
