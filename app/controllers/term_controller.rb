# app/controllers/term_controller.rb

class TermController < ApplicationController
  def index
    @terms = Term.all
    @term = Term.new  # Add this line to instantiate a new Term object
  end

  def create
    @term = Term.new(term_params)
    @term.ip_address = request.remote_ip
    @term.save
    redirect_to action: :index
  end

  private

  def term_params
    params.require(:term).permit(:query)
  end

  def analytics
    @terms = Term.all
  end
end
