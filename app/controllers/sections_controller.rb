class SectionsController < ApplicationController
  def show
    render json: {"details": [{"text":"First chapter", "id": params[:id],
      "author": "kalashri and minu"}]}
  end
end