<script>
  function loadPageFivePer (pageNumber){
      var mimeCarAPI = "http://mimeocarlisting.azurewebsites.net/api/cars/" + pageNumber + "/5";
      $.getJSON(mimeoCarAPI){
          .done(function(data){
              var list = $('<ul/>', {
                  "id": "page" + pageNumber + "list"
              }).insertBefore( $('#end') );
              $.each(data, function(key,value){
                  list.append("<li>" + key + ":" + val + "</li>");
              });
          })
          .fail(function(){
             $('#end').text("Something went wrong :("); 
          });
      }
  }
  //isInView function based off of Stack Overflow
  function isInView(elem){
     return $(elem).offset().top - $(window).scrollTop() < $(elem).height() ;
  }

  $( document ).ready(function() {
      $('body').append("<div id='end'></div>");
      loadPageFivePer(1);
  });

  $( window ).scroll(function() {
      if (isInView($('#end'))){
          var nextPage = $('#end').closest('ul').attr('id') + 1;
          loadPageFivePer(nextPage);
      }
  });
</script>
<body></body>