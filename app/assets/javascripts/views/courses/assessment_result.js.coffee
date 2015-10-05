class CourseTaker.Views.AssessmentResultView extends Backbone.View
  template: JST['courses/assessment_result']

  initialize: ->
    @render()

  render: ->
    @$el.html @template
    @