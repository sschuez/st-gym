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
  end
  
  private
  
  def display_header
    text @workout.name, size: 40, color: '7E73FF'
    text @workout.description, size: 20
    move_down 20
  end
  
  def display_blocks
    # draw_text "Order #: #{@order.order_number}", at: [400, 712]
    blocks = @workout.blocks.order(position: :asc)
    blocks.each do |block| 
      # text "#{block.title} #{instance_repetitions(block)}", size: 30, color: 'f2c94c'
      text(
        "<color rgb='f2c94c'>#{block.title}</color>#{instance_repetitions(block)}",
        size: 30,
        # color: '0000FF',
        inline_format: true
      )
      
      # table([ [block.title, instance_repetitions(block)] ])
      
      move_down 10
      block_exercises(block)
      move_down 20
      
    end
  end

  def block_exercises(block)
    array = []
    array << ["Exercise", { content: "Repetitions", align: :right }]
    exercise_instances(array, block)
    # array << total_price
    table(array, column_widths: [400, 125]) do
      cells.borders = []
      row(0).borders = [:bottom]
    end
  end

  def exercise_instances(array, block)
    block.exercise_instances.includes(:exercise).each do |exercise_instance|
      array << [
        exercise_instance.exercise.name,
        { content: instance_repetitions(exercise_instance), align: :right }
      ]
    end
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