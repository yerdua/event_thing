Project2.Views.AddVenue = Backbone.View.extend({
  events: {
    'click li' : 'addVenue',
  },
  
  initialize: function(options){
    this.collection = options.collection;
    this.$hiddenField = options.$hiddenField;
  },
  
  template: JST['venues/add_venue'],
  
  render: function () {
    var renderedContent = this.template({
      venues: this.collection
    });
    
    this.$el.html(renderedContent);
    return this;
  },
  
  addVenue: function (event) {
    var venueId = event.currentTarget.getAttribute('data-id');
    this.$hiddenField.val(venueId);
    
    this.$el.find('li').removeClass('selected');
    $(event.currentTarget).toggleClass('selected');
  },
  
});