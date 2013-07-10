Project2.Routers.Events = Backbone.Router.extend({
  routes: {
    "": "index",
    "new" : "new"
  },
  
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },
  
  index: function () {
    var that = this;
    Project2.Store.events.fetch({
      success: function (events) {
        var indexView = new Project2.Views.EventsIndex({
          collection: Project2.Store.events
        });
        
        that.$rootEl.html(indexView.render().$el);
      }
    });
  },
  
  new: function () {
    var that = this;
    
    var formView = new Project2.Views.EventForm({
      collection: Project2.Store.events,
      model: new Project2.Models.Event()
    });
    
    this.$rootEl.html(formView.render().$el);
  }
});
