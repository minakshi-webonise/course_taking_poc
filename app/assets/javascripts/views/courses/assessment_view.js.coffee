class CourseTaking.Views.AssessmentView extends Backbone.View
  template: JST['courses/assessment']

  initialize: ->
    @render()

  render: ->
    @$el.html @template
    @



