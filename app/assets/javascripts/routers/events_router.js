Project2.Routers.Events = Backbone.Router.extend({
  routes: {
    "": "index",
    "new" : "new",
    ":id" : "show",
    ":id/edit" : "edit",
  },
  
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.$popup = options.$popup;
    this.collection = options.collection;
  },
  
  edit: function (id) {
    var that = this;
    
    this._withEvent(id, function (event){
      var formView = new Project2.Views.EventForm({
        model: event
      });
      
      that.$rootEl.html(formView.render().$el);
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
      var detailView = new Project2.Views.EventDetail({
        model: event
      });
      
      that.$rootEl.html(detailView.render().$el);
    });
  },
  
  _withEvent: function (id, callback) {
    var event = Project2.Models.Event.findOrCreate({id: id});
    
    if (event.get('title')) {
      callback(event);
    } else {
      event.fetch({
        success: callback
      });
    }
  }
});
