class CourseTaker.Views.CourseContentView extends Backbone.View
  textTemplate: JST['courses/course_content']
  assessmentTemplate: JST['courses/assessment']
  practiseTemplate: JST['courses/practise']
  resultTemplate: JST['courses/assessment_result']

  events: {'click .saveOption': 'answerSave' ,'click .savePractiseOption': 'practiseAnswerSave' }

  initialize: (options)->
    @dataId = options.dataId
    @dataType = options.dataType

  render: ->
    $('.course-content-wrap').html('')
    if @dataType is 'text'
      @textModel = new CourseTaker.Models.CourseContent()
      @textModel.set({id:@dataId })

      @textModel.fetch({
        success: =>
          @$el.html @textTemplate({section:@textModel.get('details')})
      })
    else if @dataType is 'assignment'
      @assesmentModel = new CourseTaker.Models.CourseAssessment()
      @assesmentModel.fetch({
        success: =>
          @$el.html @assessmentTemplate({assessment: @assesmentModel.get('questions')})
        })
    else if @dataType is 'practice_test'
      @practiseModel = new CourseTaker.Models.CoursePractiseTest()
      @practiseModel.fetch({
        success: =>
          @$el.html @practiseTemplate({practise: @practiseModel.get('questions')})
        })

  answerSave: (events) ->
    questionId = $(events.currentTarget).attr('data-id')
    @assessmnetSaveModel = new CourseTaker.Models.AssessmentSave()
    cTaker = null
    $.each $('.assessmentOptions'), (value) ->
      if $(this).prop('checked')
        optionId = $(this).attr 'id'
        cTaker = optionId

    @assessmnetSaveModel.set({selected_answer: cTaker})
    @assessmnetSaveModel.save null,
      success: (model, response) =>
        $('.saveOption').attr('disabled','disabled')
        @$el.html('')
        if response['selected_answer'] is response['correct_answer']
          @$el.append @resultTemplate()
        else
          @$el.append 'Oppss your answer is not correct'
        return
      error: (model, response) ->
        console.log('error in saving question')
        return


  practiseAnswerSave: (events) ->
    @practiceSaveModel = new CourseTaker.Models.PractiseSave()
    practiseOptionId = null
    $.each $('.practiseOptions'), (value) ->
      if $(this).prop('checked')
        optionId = $(this).attr 'id'
        practiseOptionId = optionId

    @practiceSaveModel.set({selected_answer: practiseOptionId})
    @practiceSaveModel.save null,
      success: (model, response) =>
        @$el.html('')
        if response['selected_answer'] is response['correct_answer']
          @$el.append @resultTemplate()
        else
          @$el.append 'Oppss!! your answer is not correct'
        return
      error: (model, response) ->
        console.log('error in saving question')
        return


