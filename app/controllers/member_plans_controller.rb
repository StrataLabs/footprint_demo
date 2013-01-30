class MemberPlansController < ApplicationController
  	def index
  		unless params[:id].nil?
	    	params[:page] = params[:page] || 1
	    	p id=params[:id]
			a=MemberPlan.find(id)
			book_hash = []
			unless a.nil?
				b = a.impressions.desc(:updated_at).to_a.paginate(:page => params[:page], :per_page => 5)
				b.each do |impression|
					book_hash << { :first_name => impression.first_name, :updated_at => impression.updated_at }
				end
			end
			respond_to do | format |
				format.xml {render :xml => book_hash, :root => :book, :status => :ok}
		   	end
		end
	end
end