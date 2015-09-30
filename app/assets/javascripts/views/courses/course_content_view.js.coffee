class CourseTaking.Views.CourseContentView extends Backbone.View
  template: JST['courses/course_content']
  template1: JST['courses/assessment']

  events: 'click .saveOption': 'answerSave'

  initialize: (options)->
    @dataId = options.dataId


  render: ->
    @model = new CourseTaking.Models.CourseContent()
    @model.set({id:@dataId })
    @model.fetch({
      success: =>
        console.log('some one', @model.get('section_type'))
        if @model.get('section_type') is 'assesment'

          @assesmentModel = new CourseTaking.Models.CourseAssessment()
          @assesmentModel.fetch({
            success: =>
              @$el.html @template1({assessment: @assesmentModel.get('questions')})
            })
          # @assesment = new CourseTaking.Views.AssessmentView({model:@assesmentModel, el: @$el})
          # console.log('newwwwwwwwwwwwwwww', @assesmentModel)
          # @$el.html @template1({assessment: @assesmentModel})
        else
          @$el.html @template({id: @model.get('id'),text: @model.get('text'), type: @model.get('section_type')})
        @
    })

  answerSave: (events) ->
    optionId = $(events.currentTarget).attr('data-id')
    console.log('element', $('input[name="option_#{optionId}"]').find('.assessmentOptions').prop("checked", true))
    if $('input[name="option<%=optionId%>"]').find('.assessmentOptions').prop("checked", true)

      alert('yoooooo')
    console.log('callles', $(events.currentTarget).attr('data-id'))



