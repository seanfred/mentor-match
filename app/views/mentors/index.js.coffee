$("#studentsLinksDiv").empty().append("<%= j render 'studentlist' %>").hide().slideDown("slow")
if ("a.students")
  $("a.students").on "click", ->
    $("a.students").removeClass("studentSelected")
    $("a.studentSelected").addClass("students")
    $("a.match").removeClass("matchSelected")
    $("a.matchSelected").addClass("match")
    $(@).removeClass("students").addClass("studentSelected")
