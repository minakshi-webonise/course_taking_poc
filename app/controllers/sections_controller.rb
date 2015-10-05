class SectionsController < ApplicationController
  def show
    render json: {"details": [{"text":"First chapter", "id": params[:id],
      "author": "kalashri and minakshi" ,
      "topic": "coffeeScript with Backbone.js",
      "details": "Backbone is suitable for projects of just about any size, ranging from the most complex browser-based applications to quite humble little features. In this chapter we will use Backbone and CoffeeScript to build an example of the latter: a user feedback widget that will run right here in the page. Creating it will take us on a speedy tour through Backbone's components: Model, View, Collection, and Router. When we're done, I hope you will use the widget we've built to let me know how you liked the experience."
      }]}
  end
end