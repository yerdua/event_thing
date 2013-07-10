Project2.Views.EventsIndex = Backbone.View.extend({

  template: JST['events/index'],
  
  render: function () {
    var renderedContent = this.template({
      events: this.collection
    });
    
    this.$el.html(renderedContent);
    
    return this;
  }

});
