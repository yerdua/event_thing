Project2.Views.EventForm = Backbone.View.extend({
  
  events: {
    'click input#event_submit': "submit",
    'click button#choose_venue': 'showVenuePicker' 
  },
  
  initialize: function () {
    this.listenTo(this.model, "change", this.render);
  },

  template: JST['events/form'],
  
  render: function () {
    var renderedContent = this.template({
      event: this.model,
    });
    
    this.$el.html(renderedContent);
    
    return this;
  },
  
  showVenuePicker: function (event) {
    event.preventDefault();
    console.log('clicky');
    var that = this;
    
    Project2.Store.venuesAll.fetch({
      success: function () {
        var venuePicker = new Project2.Views.AddVenue({
          collection: Project2.Store.venuesAll,
          $hiddenField: that.$el.find("#event_venue_id")
        });
        
        that.$el.find('#venue_picker').html(venuePicker.render().$el);
      }
    });
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
