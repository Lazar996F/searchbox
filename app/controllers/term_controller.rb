class TermController < ApplicationController
    def index
      @terms = Term.all
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
  end  