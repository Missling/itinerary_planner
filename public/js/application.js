var add_destination = function(event){
  var itinerary_id = $('#itinerary_id').val();
  var $winery = $(event.target).closest(".winery");
  var winery_name = $winery.find('.winery_name a').text();
  var review_count = $winery.find('.review_count').text();
  var image_url = $winery.find('.image_url').attr("src");
  var yelp_url = $winery.find('.yelp_url').attr("href");
  var address = $winery.find('.address').text();


  var request = $.ajax({
    url: '/itineraries/'+itinerary_id+'/destinations',
    type: "POST",
    data: {
      name: winery_name,
      review_count: review_count,
      image_url: image_url,
      yelp_url: yelp_url,
      address: address
    }
  });
}

$(document).ready(function() {
  $('.checkbox').on('change', add_destination);
});
