module ApplicationHelper
  def query_array
    params[:query].to_s.split(' ')
  end
  
end
