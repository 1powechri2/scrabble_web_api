class WordValidatorController < ApplicationController
  def show
    @word = WordPresenter.new(params[:search])
  end
end
