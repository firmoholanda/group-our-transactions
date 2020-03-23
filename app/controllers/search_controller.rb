class SearchController < ApplicationController
  
  def search 
    @parameter = params[:search]
    @results = Project.where('name LIKE ?', "%#{@parameter}%")
  end

end