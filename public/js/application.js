$(document).ready(function() {
  $('.checkbox').on('click', function{

  });

  var add_destination = function(event){
    var itinerary_id = $('#itinerary_id').val();
    var $winery = $(event.target).closest("winery");
    var winery_name = $winery.find('.winery_name').value;

    var request = $.ajax({
      url: '/itineraries/'+itinerary_id+'/destinations',
      type: "POST",
      data: {
        name: winery_name,
        
      }
    });
  };
});
