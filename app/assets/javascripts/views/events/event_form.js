Project2.Views.EventForm = Backbone.View.extend({
  
  events: {
    'click input[type="submit"]': "submit"
  },

  template: JST['events/form'],
  
  render: function () {
    var renderedContent = this.template({
      events: this.collection,
      event: this.model
    });
    
    this.$el.html(renderedContent);
    
    return this;
  },
  
  submit: function (event) {
    event.preventDefault();

    var attrs = $(event.target.form).serializeJSON();
    this.model.save(attrs, {
      success: function () {
        Backbone.history.navigate("#/", { trigger: true });
      },
      error: function (model, response) {
        console.log(response.responseJSON);
      }
    });
  }
});
