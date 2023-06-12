module ApplicationHelper
  include Pagy::Frontend
  
  def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "shared/flash"
  end

  def form_error_notification(object)
    if object.errors.any?
      tag.div class: "error-message" do
        object.errors.full_messages.to_sentence.capitalize
      end
    end
  end

  def nested_dom_id(*args)
    args.map { |arg| arg.respond_to?(:to_key) ? dom_id(arg) : arg }.join("_")
  end
  
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

  def dropzone_controller_div
    data = {
      controller: "dropzone",
      'dropzone-max-file-size'=>"8",
      'dropzone-max-files' => "10",
      'dropzone-accepted-files' => 'image/jpeg,image/jpg,image/png,image/gif',
      'dropzone-dict-file-too-big' => "Your file ({{filesize}} MB) is larger than allowd ({{maxFilesize}} MB)",
      'dropzone-dict-invalid-file-type' => "Invalid file type. Only jpg, .png or .gif are allowed",
    }
  
    content_tag :div, class: 'dropzone dropzone-default dz-clickable', data: data do
      yield
    end
  end
end
