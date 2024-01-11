# app/controllers/term_controller.rb

class TermController < ApplicationController
  before_action :set_term, only: [:show, :edit, :update, :destroy]

  def index
    @terms = Term.all
    @term = Term.new

    respond_to do |format|
      format.html
      format.json { render json: search_terms }
    end
  end

  def create
    @term = Term.new(term_params)
    @term.ip_address = request.remote_ip

    respond_to do |format|
      if @term.save
        format.html { redirect_to action: :index, notice: 'Term was successfully created.' }
        format.json { render json: @term, status: :created, location: @term }
      else
        format.html { render action: :index }
        format.json { render json: @term.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def term_params
    params.require(:term).permit(:query)
  end

  def set_term
    @term = Term.find(params[:id])
  end

  def search_terms
    query = params[:query].to_s.strip
    return [] if query.blank?

    Term.where('query LIKE ?', "%#{query}%")
  end
end
