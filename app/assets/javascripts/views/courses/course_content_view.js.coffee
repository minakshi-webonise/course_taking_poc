class CourseTaking.Views.CourseContentView extends Backbone.View
  textTemplate: JST['courses/course_content']
  template1: JST['courses/assessment']
  practiseTemplate: JST['courses/practise']

  events: 'click .saveOption': 'answerSave'

  initialize: (options)->
    @dataId = options.dataId
    @dataType = options.dataType



  render: ->
    $('.course-content-wrap').html('')
    if @dataType is 'text'
      @textModel = new CourseTaking.Models.CourseContent()
      @textModel.set({id:@dataId })

      @textModel.fetch({
        success: =>
          @$el.html @textTemplate({section:@textModel.get('details')})
      })
    else if @dataType is 'assignment'
      @assesmentModel = new CourseTaking.Models.CourseAssessment()
      @assesmentModel.fetch({
        success: =>
          @$el.html @template1({assessment: @assesmentModel.get('questions')})
        })
    else if @dataType is 'practice_test'
      @practiseModel = new CourseTaking.Models.CoursePractiseTest()
      @practiseModel.fetch({
        success: =>
          @$el.html @practiseTemplate({practise: @practiseModel.get('questions')})
        })

  answerSave: (events) ->
    questionId = $(events.currentTarget).attr('data-id')
    @assessmnetSaveModel = new CourseTaking.Models.AssessmentSave()
    cTaker=null
    $.each $('.assessment-option-'+questionId).find('.assessmentOptions'), (value) ->
      if $(this).prop('checked')
        optionId = $(this).attr 'id'
        cTaker=optionId

    @assessmnetSaveModel.set({selected_answer: cTaker})
    @assessmnetSaveModel.save



  # checkedAnswerSave: (events) ->
  #   console.log('selected options are', $('input[name="option_0"]:checked'))
  #   $('input[name="option_0"]:checked')



