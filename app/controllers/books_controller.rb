class BooksController < ApplicationController
  	def index
  		params[:book_id] = params[:book_id] || 1
	    unless params[:book_id].nil?
	    	params[:page] = params[:page] || 1
	    	book_id=params[:book_id]
			a=Book.find_by_bookid(book_id)
			book_hash = []
			unless a.nil?
				b = a.impressions.desc(:updated_at).to_a.paginate(:page => params[:page], :per_page => 5)
				b.each do |impression|
					book_hash << { :status => impression.status, :location => impression.location, 
						:origlocation => impression.origlocation, :updated_at => impression.updated_at }
				end
			end
			respond_to do | format |
				format.xml {render :xml => book_hash, :root => :book, :status => :ok}
		   	end
		end
	end
end