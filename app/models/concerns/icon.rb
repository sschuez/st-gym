class Icon
  def initialize(icon)
    @icon = icon
    @icons = {
      trash: '<i class="bi bi-trash-fill"></i>',
      edit: '<i class="bi bi-pencil-fill"></i>',
      confirm: '<i class="bi bi-check-circle-fill"></i>',
      cancel: '<i class="bi bi-x-circle-fill"></i>',
      handle: '<i class="bi bi-grip-horizontal handle mt-xxs ml-s"></i>',
      repeat: '<i class="bi bi-arrow-repeat"></i>',
      hamburger: '<i class="bi bi-list hamburger"></i>',
      close: '<i class="bi bi-x"></i>',
      close_lg: '<i class="bi bi-x-lg"></i>',
      sign_out: '<i class="fas fa-sign-out-alt"></i>',
      sign_in: '<i class="fas fa-sign-in-alt"></i>',
      translate: '<i class="bi bi-translate"></i>',
      admin: '<i class="fas fa-user-shield"></i>',
      bicycle: '<i class="fas fa-bicycle"></i>',
      person: '<i class="bi bi-person"></i>',
      exercise: '<i class="fas fa-dumbbell"></i>',
      fist: '<i class="fas fa-fist-raised"></i>'
    }
  end

  def call
    @icons[@icon.to_sym].html_safe
  end
end
