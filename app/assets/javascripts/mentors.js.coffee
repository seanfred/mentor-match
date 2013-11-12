# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
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
  if ("a.students")
    $("a.students").on "click", ->
      $("a.studentSelected").addClass("students")
      $("a.students").removeClass("studentSelected")
      $("a.match").removeClass("matchSelected")
      $("a.matchSelected").addClass("match")
      $(@).removeClass("students").addClass("studentSelected")

  if ("a.match")
    $("a.match").on "click", ->
      $("a.match").removeClass("matchSelected")
      $("a.matchSelected").addClass("match")
      $("a.studentSelected").addClass("students")
      $("a.students").removeClass("studentSelected")
      $("a.mentors").removeClass("mentorSelected")
      $("a.mentorSelected").addClass("mentors")
      $(@).removeClass("match").addClass("matchSelected")

  if ("#filterStudents")
    $("#filterStudents").on "change", ->
      url = "/students"
      $.get url, (data)->
        $("#studentsLinksDiv").text(data)