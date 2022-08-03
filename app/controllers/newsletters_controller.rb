class NewslettersController < ApplicationController
  skip_before_action :authenticate_user!#, only: [ :new, :show ]
  
  # require 'MailchimpMarketing'

  def create
    
    begin
      client = MailchimpMarketing::Client.new()
      client.set_config({
        :api_key => Rails.application.credentials.dig(:mailchimp, :api_key),
        :server => Rails.application.credentials.dig(:mailchimp, :server)
      })
      result = client.ping.get()
      p result
    rescue MailchimpMarketing::ApiError => e
      puts "Error: #{e}"
    end
  end

end