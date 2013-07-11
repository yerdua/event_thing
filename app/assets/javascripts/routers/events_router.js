Project2.Routers.Events = Backbone.Router.extend({
  routes: {
    "": "index",
    "new" : "new",
    ":id" : "show"
  },
  
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.collection = options.collection;
  },
  
  index: function () {
    var that = this;
    this.collection.fetch({
      success: function (events) {
        var indexView = new Project2.Views.EventsIndex({
          collection: that.collection || Project2.Store.events
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
  },
  
  show: function(id) {
    var that = this;
    
    that._withEvent(id, function (event) {
      that.$rootEl.html(event.get('title'))
    });
  },
  
  _withEvent: function (id, callback) {
    var event = this.collection.get(id);
    
    if (event) {
      callback(event);
    } else {
      event = new Project2.Models.Event({
        id: id
      });
      
      event.fetch({
        success: callback
      });
    }
  }
});
