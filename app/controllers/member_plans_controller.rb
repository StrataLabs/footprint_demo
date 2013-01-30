class MemberPlansController < ApplicationController
  	def index
  		unless params[:id].nil?
	    	params[:page] = params[:page] || 1
	    	id=params[:id]
			a=MemberPlan.find(id)
			book_hash = []
			unless a.nil?
				b = a.impressions.desc(:updated_at).to_a.paginate(:page => params[:page], :per_page => 5)
				b.each do |impression|
					book_hash << { :first_name => impression.first_name, :updated_at => impression.updated_at }
				
				end
				p "here"
				c = a.impressions.desc(:updated_at)
				d=c[0]
				e=c[1]
				p d.first_name
				p e.first_name
				if d.first_name != e.first_name
					p "not equal"
				end
			end
			
			respond_to do | format |
				format.xml {render :xml => book_hash, :root => :book, :status => :ok}
		   	end
		end
	end
end