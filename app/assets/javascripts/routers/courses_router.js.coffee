class CourseTaker.Routers.Courses extends Backbone.Router

  routes:
    "index"       : "index"
    ".*"          : "index"


  index: ->
    @course = new CourseTaker.Models.Course()
    @view = new CourseTaker.Views.CoursesIndex({
       model: @course
    })
    @course.fetch()


