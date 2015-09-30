class CourseTaking.Views.AssessmentView extends Backbone.View
  template: JST['courses/assessment']

  initialize: ->
    alert('yoooooooo called finally')
    @render()

  render: ->
    @$el.html @template
    @



