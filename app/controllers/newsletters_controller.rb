class NewslettersController < ApplicationController
  skip_before_action :authenticate_user!#, only: [ :new, :show ]
  
  # require 'MailchimpMarketing'
  def addUser
    # raise
    dc = Rails.application.credentials.dig(:mailchimp, :server)
    audience_id = Rails.application.credentials.dig(:mailchimp, :audience_id)
    url = "https://#{dc}.api.mailchimp.com/3.0/lists/#{audience_id}/members"
    api_key = Rails.application.credentials.dig(:mailchimp, :api_key)

    # Pass status:subscribed field to ensure the user is subscribed
    user_details = {
      email_address: params[:email_address],
      status: "subscribed",
      # merge_fields: {
        # FNAME: params[:fname],
        # LNAME: params[:company],
        # PHONE: params[:phone],
        # COMPANY: params[:company],
      # },
    };

    # Create a new connection using Faraday
    conn = Faraday.new(
    url: url,
    headers: {'Content-Type' => 'application/json', 'Authorization': "Bearer #{api_key}"}
    )

    response = conn.post() do |req|
      req.body = user_details.to_json
    end

    # Parse the JSON response sent back from the Mailchimp servers
    response_body = JSON.parse(response.body)

    # Check if the subscription is successful
    if response.status == 200
      render json: {
        status: response.status,
        message: "#{user_details[:email_address]} has been added to the mailing list"
      }
    else
      render json: {
        status: response.status,
        message: response_body["detail"]
      }
    end
  end

  # Accept parameters into your API
  def mailing_list_params
    params.permit(:fname, :lname, :phone, :company, :email_address)
  end
end