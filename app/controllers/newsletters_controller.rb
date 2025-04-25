class NewslettersController < ApplicationController
  require "digest"
  skip_before_action :authenticate_user! # , only: [ :new, :show ]

  # require 'MailchimpMarketing'
  def addUser
    skip_authorization
    dc = Rails.application.credentials.dig(:mailchimp, :server)
    audience_id = Rails.application.credentials.dig(:mailchimp, :audience_id)
    url = "https://#{dc}.api.mailchimp.com/3.0/lists/#{audience_id}/members"
    api_key = Rails.application.credentials.dig(:mailchimp, :api_key)

    # Pass status:subscribed field to ensure the user is subscribed
    user_details = {
      email_address: params[:email_address],
      status: "subscribed"
      # merge_fields: {
      # FNAME: params[:fname],
      # LNAME: params[:company],
      # PHONE: params[:phone],
      # COMPANY: params[:company],
      # },
    }

    # Create a new connection using Faraday
    conn = Faraday.new(
      url: url,
      headers: { "Content-Type" => "application/json", Authorization: "Bearer #{api_key}" }
    )

    response = conn.post do |req|
      req.body = user_details.to_json
    end

    # Parse the JSON response sent back from the Mailchimp servers
    response_body = JSON.parse(response.body)

    # Check if the subscription is successful
    respond_to do |format|
      if response.status == 200

        format.json do
          render json: { status: response.status,
                         message: "#{user_details[:email_address]} has been added to the mailing list" }
        end
        format.turbo_stream do
          flash.now[:notice] = "#{user_details[:email_address]} has been added to the mailing list"
        end
        format.html do
          redirect_to request.referer, notice: "#{user_details[:email_address]} has been added to the mailing list"
        end
      else
        format.json { render json: { status: response.status, message: response_body["detail"] } }
        format.turbo_stream { flash.now[:alert] = response_body["detail"] }
        format.html { redirect_to request.referer, alert: response_body["detail"] }
      end
    end
  end

  # Currently inactive
  def removeUser
    skip_authorization
    # get the user's email address
    user_email = params[:email_address]

    # get a hash of the user's email address
    subscriber_hash = Digest::MD5.new
    subscriber_hash << user_email

    # Setup the keys needed to access Mailchimp's API
    dc = Rails.application.credentials.dig(:mailchimp, :server)
    audience_id = Rails.application.credentials.dig(:mailchimp, :audience_id)
    url = "https://#{dc}.api.mailchimp.com/3.0/lists/#{audience_id}/members/#{subscriber_hash}"
    api_key = Rails.application.credentials.dig(:mailchimp, :api_key)

    # Create a new connection using Faraday
    conn = Faraday.new(
      url: url,
      headers: { "Content-Type" => "application/json", Authorization: "Bearer #{api_key}" }
    )

    # Make a PUT request to the mailchimp endpoint and pass in the unsubscribed status
    response = conn.put do |req|
      req.body = { status: "unsubscribed" }.to_json
    end

    # Parse the JSON response sent back from the Mailchimp servers
    JSON.parse(response.body)

    # Check if the unsubscription is successful
    if response.status == 200
      render json: {
        status: response.status,
        message: "Successfully unsubscribed from the mailing list"
      }
    else
      render json: {
        status: response.status,
        message: "Something went wrong"
      }
    end
  end

  private

  # Accept parameters into your API
  def mailing_list_params
    params.permit(:fname, :lname, :phone, :company, :email_address)
  end
end
