Project2.Routers.Events = Backbone.Router.extend({
  routes: {
    "": "index",
    "new" : "new",
    "add_venue" : "addVenue",
    ":id" : "show",
  },
  
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.$popup = options.$popup;
    this.collection = options.collection;
  },
  
  addVenue: function () {
    var that = this;
    Project2.Store.venuesAll.fetch({
      success: function (venues) {
        var addVenue = new Project2.Views.EventAddVenue({
          collection: Project2.Store.venuesAll
        });
        
        that.$popup.html(addVenue.render().$el);
      }
    });
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
