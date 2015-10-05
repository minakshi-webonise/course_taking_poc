class AssessmentsController < ApplicationController

  def show
    render json: {"id":"1",
      "questions":[
      {"question":"First questions",
       "answers":{"1":"true","2":"false"}
      },
      {"question":"Second questions",
       "answers":{"3":"true","4":"false"}
      }]
      }
  end

  def practise_data
    render json: {"id":"1",
      "questions":[
        {"question":"Favourite place to visit?",
         "answers":{"1":"Shimla","2":"Kerala", "3": "Maharashtra", "4":"Out of India"}
        }
      ]
    }
  end
end