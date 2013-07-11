Project2.Models.User = Backbone.RelationalModel.extend({
  relations: [{
    type: 'HasMany',
    key: 'events',
    relatedModel: 'Project2.Models.Event',
  }],
  // 
  // url: function () {
  //   if (this.id) {
  //     return '/api/users/' + this.id;
  //   } else {
  //     return '/api/users'
  //   }  
  // }
  
  urlRoot: '/api/users'
});
