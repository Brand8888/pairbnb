class StaticController < ApplicationController
     def index
         @listings = Listing.all
     end
end
