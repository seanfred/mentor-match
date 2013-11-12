$("#rankingsDiv").empty().append("<%= j render 'students/rankings' %>")

if ("#studentranks")
  $("#studentranks").sortable
    update: (event, ui) ->
  $("#studentranks").disableSelection()

$("#studentranks").on "sortupdate", ( event, ui) ->
  ranking = $("ol#studentranks li").get()
  new_ranking = {}
  ranking.forEach ( el, i ) ->
    new_ranking[el.id] = i + 1
  $.ajax {
      type: "PUT"
      url: "/studentrank"
      data: { ranking : JSON.stringify( new_ranking ) },
      dataType: 'json'
      complete: ( jqxhr, status ) ->
        console.log jqxhr.status
  }
