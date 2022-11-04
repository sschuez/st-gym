class WorkoutPdf
  include Prawn::View
  # include ActiveSupport::NumberHelper

  def initialize(workout)
    @workout = workout
    content
  end

  def content
    display_header
    move_down 25
    display_blocks
    # display_order_created_at
    
    
    # display_items
  end
  
  private
  
  def display_header
    text @workout.name
    text @workout.description
  end
  
  def display_blocks
    # draw_text "Order #: #{@order.order_number}", at: [400, 712]
    blocks = @workout.blocks.order(position: :asc)
    blocks.each do |block| 
      text "#{block.title} #{instance_repetitions(block)}"
      block_exercises(block)
      move_down 15
    end
  end

  def block_exercises(block)
    block.exercise_instances.includes(:exercise).each do |exercise_instance|
      text "#{exercise_instance.exercise.name} #{instance_repetitions(exercise_instance)}"
    end
  end

  def instance_repetitions(instance)
    if instance.tabata
      "--> #{instance.time}s"
    else
      "--> #{instance.repetitions}x"
    end
  end
  
  # def display_order_created_at
  #   draw_text @order.created_at, at: [400, 698]
  # end

  # def display_items
  #   array = []
  #   array << ["Description", "Quantity", { content: "Price", align: :right }]
  #   order_items(array)
  #   array << total_price
  #   table(array, column_widths: [340, 75, 125]) do
  #     cells.borders = []
  #     row(0).borders = [:bottom]
  #   end
  # end

  # def order_items(array)
  #   @order.order_items.each do |item|
  #     array << [
  #       item.description,
  #       item.quantity,
  #       { content: number_to_currency(item.price), align: :right }
  #     ]
  #   end
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