class CourseTaker.Views.CourseOutlineView extends Backbone.View
  template: JST['courses/course_outline']

  initialize: ->
    @render

  render: () ->
    @$el.html @template(courses: @model.get('chapters'))
    @



