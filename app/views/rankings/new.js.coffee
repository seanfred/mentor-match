$("#rankingsDiv").empty().append("<%= j render 'mentors/rankings' %>")

if ("#ranks")
  $("#ranks").sortable
    update: (event, ui) ->
  $("#ranks").disableSelection()

$("#ranks").on "sortupdate", ( event, ui) ->
  ranking = $("ol#ranks li").get()
  new_ranking = {}
  ranking.forEach ( el, i ) ->
    new_ranking[el.id] = i + 1
  $.ajax {
      type: "PUT"
      url: "/rank"
      data: { ranking : JSON.stringify( new_ranking ) },
      dataType: 'json'
      complete: ( jqxhr, status ) ->
        console.log jqxhr.status
  }