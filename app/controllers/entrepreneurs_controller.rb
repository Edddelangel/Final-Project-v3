class EntrepreneursController < ApplicationController
  def index
    matching_entrepreneurs = Entrepreneur.all

    @list_of_entrepreneurs = matching_entrepreneurs.order({ :created_at => :desc })

    render({ :template => "entrepreneurs/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_entrepreneurs = Entrepreneur.where({ :id => the_id })

    @the_entrepreneur = matching_entrepreneurs.at(0)

    render({ :template => "entrepreneurs/show.html.erb" })
  end

  def create
    the_entrepreneur = Entrepreneur.new
    the_entrepreneur.first_name = params.fetch("query_first_name")
    the_entrepreneur.last_name = params.fetch("query_last_name")
    the_entrepreneur.email = params.fetch("query_email")
    the_entrepreneur.mobile = params.fetch("query_mobile")

    if the_entrepreneur.valid?
      the_entrepreneur.save
      redirect_to("/entrepreneurs", { :notice => "Entrepreneur created successfully." })
    else
      redirect_to("/entrepreneurs", { :notice => "Entrepreneur failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_entrepreneur = Entrepreneur.where({ :id => the_id }).at(0)

    the_entrepreneur.first_name = params.fetch("query_first_name")
    the_entrepreneur.last_name = params.fetch("query_last_name")
    the_entrepreneur.email = params.fetch("query_email")
    the_entrepreneur.mobile = params.fetch("query_mobile")

    if the_entrepreneur.valid?
      the_entrepreneur.save
      redirect_to("/entrepreneurs/#{the_entrepreneur.id}", { :notice => "Entrepreneur updated successfully."} )
    else
      redirect_to("/entrepreneurs/#{the_entrepreneur.id}", { :alert => "Entrepreneur failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_entrepreneur = Entrepreneur.where({ :id => the_id }).at(0)

    the_entrepreneur.destroy

    redirect_to("/entrepreneurs", { :notice => "Entrepreneur deleted successfully."} )
  end
end
