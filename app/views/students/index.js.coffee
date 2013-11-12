$("#mentorsLinksDiv").empty().append("<%= j render 'mentorlist' %>").hide().slideDown("slow")

$("a.mentors").on "click", ->
  $("a.mentors").removeClass("mentorSelected")
  $("a.mentorSelected").addClass("mentors")
  $("a.match").removeClass("matchSelected")
  $("a.matchSelected").addClass("match")
  $(@).removeClass("mentors").addClass("mentorSelected")
