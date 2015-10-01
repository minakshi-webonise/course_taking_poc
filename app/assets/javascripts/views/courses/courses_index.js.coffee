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

  showCourseContent:(events) ->

    # @sections.save null, success: ->
    # console.log 'success'
    # return
    @courseContent = new CourseTaking.Views.CourseContentView({
      el: @$el.find('#course_content'),
      dataId:$(events.currentTarget).attr('data-id')
    })

    $('#course_content').append @courseContent.render()
    # $('#course_info').append @courseContent.render()
    # $('.content-wrap').html('')

  toggleChapters:(events) ->
    console.log($(events.currentTarget))
    $(events.currentTarget).toggleClass('active').find('ul').slideToggle();
