# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
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

  $("a.mentors").on "click", ->
    $("a.mentors").removeClass("mentorSelected")
    $("a.mentorSelected").addClass("mentors")
    $("a.match").removeClass("matchSelected")
    $("a.matchSelected").addClass("match")
    $(@).removeClass("mentors").addClass("mentorSelected")

  if ("#filter")
    $("#filterShow").on "click", (event)->
      event.preventDefault()
      $("#filterMentorsCompany").slideToggle()

  if ("a.filterMentors")
    $("a.filterMentors").on "click", ->
      $("a.filterMentors").removeClass("filterMentorsSelected")
      $("a.filterMentorsSelected").addClass("filterMentors")
      $(@).removeClass("filterMentors").addClass("filterMentorsSelected")
      $("#filterMentorsCompany").slideUp(200)
