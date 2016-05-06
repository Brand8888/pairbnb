# require 'byebug'

class ListingsController < ApplicationController

  def index
    @listings = current_user.listings.all
  end

  def show

    @listing = Listing.find(params[:id])
  end

  def new
    @listing = current_user.listings.build
  end

  def create
    @listing = current_user.listings.new(permit_params)
      if @listing.save
         redirect_to @listing

      else
        render 'new'
      end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(permit_params)
      redirect_to @listing
    else
      render 'edit'
    end
  end


  def destroy
  @listing = Listing.find(params[:id])
  @listing.destroy

    flash[:success] = "Listing deleted"
      redirect_to @listing


  end
end


private

def permit_params
    params.require(:listing).permit(:name, :desc, :country, :state, :city, :address, :property_type, :room_type, :no_of_guest, :price_per_night)
end
