class CourseTaker.Views.CoursesIndex extends Backbone.View
  el: '#main-container'
  template: JST['courses/index']

  events: {'click .sections': 'showCourseContent' ,'click .sub-menu': 'toggleChapters' }
  initialize: ->
    @model.bind('change', @render)

  render: =>
    @collection = new CourseTaker.Collections.Courses(@model.toJSON())
    @$el.append @template(courses: @model.toJSON())
    @courseOutline = new CourseTaker.Views.CourseOutlineView({model: @model, el: @$el.find('#wrap')})
    $('#wrap').append @courseOutline.render()
    $('.sub-menu > ul').hide()
    $('.course-content-wrap').html('<h1>Welcome to Test course</h1>')


  showCourseContent:(events) ->
    @courseContent = new CourseTaker.Views.CourseContentView({
      el: @$el.find('#course_content'),
      dataId:$(events.currentTarget).attr('data-id')
      dataType:$(events.currentTarget).attr('data-type')
    })
    $('#course_content').append @courseContent.render()

  toggleChapters:(events) ->
    $(events.currentTarget).toggleClass('active').find('ul').slideToggle();
