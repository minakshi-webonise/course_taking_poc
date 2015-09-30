class SectionsController < ApplicationController
  def section_info
    render json: {'id':74, 'text':'First chapter'}
  end

  def show
    Rails.logger.info(params)
    render json: {'text': 'First chapter', 'id': params[:id], 'section_type': 'assesment'}
  end

end