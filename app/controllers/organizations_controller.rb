class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.where(nil)
    filtering_params(params).each do |key, value|
      @organizations = @organizations.public_send("#{key}_filter", value) if value.present?
    end
    render json: @organizations.order(orderby => direction), status: :ok
  end

  private

  # A list of the param names that can be used for filtering Organizations
  def filtering_params(params)
    params.slice(*valid_params)
  end

  def orderby
    if params[:orderby].present? && valid_params.include?(params[:orderby].to_sym)
      return params[:orderby].to_sym
    end
    :name
  end

  def direction
    return :desc if params[:direction].present? && (params[:direction] == "DSC")
    :asc
  end

  def valid_params
    [:name, :city, :state, :postal, :category]
  end
end