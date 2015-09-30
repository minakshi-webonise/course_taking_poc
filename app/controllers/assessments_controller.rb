class AssessmentsController < ApplicationController

  def show
    Rails.logger.info(params)
    render json: {"id":"1",
      "questions":[
      {"question":"First questions",
       "answers":{"option1":"true","option2":"false"}
      },
      {"question":"Second questions",
       "answers":{"option1":"true","option2":"false"}
      }]
      }
  end
end