# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def new
    @workout_to_save = params[:workout]
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
  end

  # POST /resource/sign_in
  def create
    @workout_to_save = params[:workout]
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    if @workout_to_save
      saved_workout = save_workout_for(resource, @workout_to_save)
      respond_with resource, location: workout_path(saved_workout)
    else
      respond_with resource, location: after_sign_in_path_for(resource)
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  private

  def save_workout_for(user, workout)
    workout = Workout.find(workout)
    new_workout = Workout.new(
      name: workout.name,
      description: workout.description,
      user: user,
      public: false
    )
    new_workout.save!
    workout.blocks.each do |block|
      new_block = new_workout.blocks.new(
        repetitions: block.repetitions,
        time: block.time,
        tabata: block.tabata,
        title: block.title,
        position: block.position
      )
      new_block.save
      block.exercise_instances.each do |exercise_instance|
        new_exercise_instance = new_block.exercise_instances.new(
          exercise: exercise_instance.exercise,
          repetitions: exercise_instance.repetitions,
          time: exercise_instance.time,
          tabata: exercise_instance.tabata,
          position: exercise_instance.position
        )
        new_exercise_instance.save
      end
    end
    return new_workout
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
