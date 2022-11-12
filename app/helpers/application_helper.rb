module ApplicationHelper
  def query_array
    params[:query].to_s.split(' ')
  end

  def present(model, presenter_class=nil)
    klass = presenter_class || "#{model.class}Presenter".constantize
    presenter = klass.new(model, self)
    yield(presenter) if block_given?
  end

  # From https://gist.github.com/shunchu/3175001
  def formatted_duration(seconds)
    times = [
      "#{seconds / 3600}h", 
      "#{seconds / 60 % 60}m", 
      "#{seconds % 60}s"
    ]
    times.select { |str| str =~ /[1-9]/ }.join(" ")
  end

end
