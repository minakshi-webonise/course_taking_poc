class CourseTaking.Views.CoursesIndex extends Backbone.View
  el: '#main-container'
  template: JST['courses/index']

  events: {'click .sections': 'showCourseContent' ,'click .sub-menu': 'toggleChapters' }
  initialize: ->
    @model.bind('change', @render)

  render: =>
    @collection = new CourseTaking.Collections.Courses(@model.toJSON())
    @$el.append @template(courses: @model.toJSON())
    @courseOutline = new CourseTaking.Views.CourseOutlineView({model: @model, el: @$el.find('#wrap')})
    console
    $('#wrap').append @courseOutline.render()
    $('.course-content-wrap').html('<h1>Welcome to our course</h1>')



  showCourseContent:(events) ->
    @courseContent = new CourseTaking.Views.CourseContentView({
      el: @$el.find('#course_content'),
      dataId:$(events.currentTarget).attr('data-id')
      dataType:$(events.currentTarget).attr('data-type')
    })
    $('#course_content').append @courseContent.render()

  toggleChapters:(events) ->
    console.log('fsd',$(events.currentTarget))
    $(events.currentTarget).toggleClass('active').find('ul').slideToggle();
