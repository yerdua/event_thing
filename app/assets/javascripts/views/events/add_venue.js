Project2.Views.EventAddVenue = Backbone.View.extend({

  template: JST['events/add_venue'],
  
  render: function () {
    var renderedContent = this.template({
      venues: this.collection
    });
    
    this.$el.html(renderedContent);
    return this;
  }
  
});