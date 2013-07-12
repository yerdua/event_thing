Project2.Views.EventDetail = Backbone.View.extend({
  template: JST['events/event_detail'],
  
  render: function () {
    var renderedContent = this.template({
      event: this.model,
    });
    
    this.$el.html(renderedContent);
    
    return this;
  },

});