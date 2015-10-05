class AssessmentsController < ApplicationController
  def show
    render json: {"id":"1",
      "questions":[
      {"question":"Explain how you can define a Inclusive range array in CoffeeScript?",
       "answers":{"1":"This range is always defined by (..)","2":"This range is always defined by (...)", "3":"none of these", "4":"1 and 2 both"}
      }]
      }
  end

  def practise_data
    render json: {"id":"1",
      "questions":[
        {"question":"Which countries are in asia continent ?",
         "answers":{"1":"US", "2":"UK", "3":"Australia", "4":"India"}
        }
      ]
    }
  end

  def quiz_correct_answer_data
    render json: {"id":"1",
      "answers":[
      {"question":"First questions",
       "correct_answers":{"1":"correct","2":"incorrect"}
      }]
      }
  end

  def save_answer
    respond_to do |format|
      format.json do
        render json: { status: true, selected_answer: params[:selected_answer],
                       correct_answer: '1' }
      end
    end
  end

  def save_practise_answer
    respond_to do |format|
      format.json do
        render json: { status: true, selected_answer: params[:selected_answer],
                       correct_answer: '4' }
      end
    end
  end

  def show_result
    render nothing: true
  end
end
