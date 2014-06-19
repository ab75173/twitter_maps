
$(document).ready(function(){

  $('#zip-submit').on('submit', function(evt){
    evt.preventDefault();
    var zipCodeValue = {zipCode: $('#q').val()}

    $.ajax({
      type: 'GET',
      url: '/events/search',
      data: zipCodeValue,
      dataType: 'json'
    }).then(function(response){
      var list = response.listOfEvents
      $('#eventList').empty();
      for (i=0; i<list.length; i++){
        var headerTwo = $("<h2>");
        var listItem = [
          "<a href='/events/",
          list[i].id,
          "'>",
          "<li class='list-group-item'>",
          list[i].title,
          "</li></a>"
          ]
          listItemString = listItem.join('');
          headerTwo.append(listItemString);
        $('#eventList').append(headerTwo);
      };
    });
  })
})
