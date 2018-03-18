class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  
  def index
    @portfolio_items = Portfolio.all
  end
  
  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def ruby_on_rails
    @ruby_on_rails_portfolio_items = Portfolio.ruby_on_rails
  end
  
  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end
  
  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio item has been updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def show
  end

  def destroy
    # Delete the record from the DB
    @portfolio_item.destroy
    # Redirect after deleting record
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Successfully deleted.' }
    end
  end
  
  private
  def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end
  
  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name])
  end
end