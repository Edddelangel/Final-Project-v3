class TransactionsController < ApplicationController
  def index
    matching_transactions = Transaction.all

    @list_of_transactions = matching_transactions.order({ :created_at => :desc })

    render({ :template => "transactions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_transactions = Transaction.where({ :id => the_id })

    @the_transaction = matching_transactions.at(0)

    render({ :template => "transactions/show.html.erb" })
  end

  def create
    the_transaction = Transaction.new
    the_transaction.project_name = params.fetch("query_project_name")
    the_transaction.industry = params.fetch("query_industry")
    the_transaction.description = params.fetch("query_description")
    the_transaction.instrument = params.fetch("query_instrument")
    the_transaction.years = params.fetch("query_years")
    the_transaction.return = params.fetch("query_return")
    the_transaction.required_funding = params.fetch("query_required_funding")
    the_transaction.entrepreneur_id = params.fetch("query_entrepreneur_id")

    if the_transaction.valid?
      the_transaction.save
      redirect_to("/transactions", { :notice => "Transaction created successfully." })
    else
      redirect_to("/transactions", { :notice => "Transaction failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_transaction = Transaction.where({ :id => the_id }).at(0)

    the_transaction.project_name = params.fetch("query_project_name")
    the_transaction.industry = params.fetch("query_industry")
    the_transaction.description = params.fetch("query_description")
    the_transaction.instrument = params.fetch("query_instrument")
    the_transaction.years = params.fetch("query_years")
    the_transaction.return = params.fetch("query_return")
    the_transaction.required_funding = params.fetch("query_required_funding")
    the_transaction.entrepreneur_id = params.fetch("query_entrepreneur_id")

    if the_transaction.valid?
      the_transaction.save
      redirect_to("/transactions/#{the_transaction.id}", { :notice => "Transaction updated successfully."} )
    else
      redirect_to("/transactions/#{the_transaction.id}", { :alert => "Transaction failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_transaction = Transaction.where({ :id => the_id }).at(0)

    the_transaction.destroy

    redirect_to("/transactions", { :notice => "Transaction deleted successfully."} )
  end
end
