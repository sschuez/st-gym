class WorkoutPdf
  include Prawn::View
  # include ActiveSupport::NumberHelper

  def initialize(workout)
    @workout = workout
    self.font_families.update("Roboto"=>{
      :normal => Rails.root.join("vendor/fonts/Roboto-Regular.ttf"),
      :italic => Rails.root.join("vendor/fonts/Roboto-Italic.ttf"),
      :bold => Rails.root.join("vendor/fonts/Roboto-Bold.ttf")
      })
    content
  end

  def content
    display_header
    move_down 25
    display_blocks
  end
  
  private
  
  def display_header
    text @workout.name, size: 40, color: '7E73FF'
    text @workout.description, size: 20
    move_down 10
    text "Generated on www.stgym.club"
    move_down 10
  end
  
  def display_blocks
    # draw_text "Order #: #{@order.order_number}", at: [400, 712]
    blocks = @workout.blocks.order(position: :asc)
    
    blocks.each do |block|
      array = [ [ block.title, { content: instance_repetitions(block), align: :right }] ]
      
      table(
        array, 
        column_widths: [340, 200], 
        :cell_style => { :size => 30, :text_color => "f2c94c" }
        ) do
          cells.borders = []
        end
        
        move_up 10
        block_exercises(block)
        move_down 25
    end

  end

  def block_exercises(block)
    array = []
    array << ["", ""]
    
    cursors = exercise_instances(array, block)
    table = table(
      array, 
      column_widths: [400, 140],
      :cell_style => { :size => 20 }
      ) do
        cells.borders = []
        # row(0).borders = [:bottom]
      end
      # start_new_page if (page_numbers.last.to_i != page_number)
      # text page_number.to_s
      # text bounds.to_s
      # start_new_page if (cursors.last.to_i > cursor)
      # text cursor.to_s
  end

  def exercise_instances(array, block)
    cursors = []
    block.exercise_instances.includes(:exercise).each do |exercise_instance|
      cursors << cursor.to_s
      array << [
        exercise_instance.exercise.name,
        { content: instance_repetitions(exercise_instance), align: :right }
      ]
    end
    return cursors
  end

  def instance_repetitions(instance)
    if instance.tabata
      formatted_duration(instance.time)
    else
      "#{instance.repetitions}x"
    end
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

  # def display_order_created_at
  #   draw_text @order.created_at, at: [400, 698]
  # end


  # def total_price
  #   [
  #     {
  #       content: [
  #         "Total Price",
  #         number_to_currency(@order.total_price)
  #       ].join(' '),
  #       align: :right,
  #       colspan: 3
  #     }
  #   ]
  # end
end