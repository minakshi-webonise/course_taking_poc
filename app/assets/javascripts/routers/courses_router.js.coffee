class CourseTaking.Routers.Courses extends Backbone.Router

  routes:
    "index"       : "index"
    ":id"         : "show"
    ":id/edit"    : "edit"
    ".*"          : "index"


  index: ->
    @course = new CourseTaking.Models.Course()
    @view = new CourseTaking.Views.CoursesIndex({
       model: @course
    })
    @course.fetch()
