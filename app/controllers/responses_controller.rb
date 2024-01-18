# frozen_string_literal: true

class ResponsesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @response = @post.responses.create(response_params.merge(user: current_user))
    if @response.save
      redirect_to @post, notice: 'Response was successfully added.'
    else
      redirect_to @post, alert: 'Unable to add response.'
    end
  end

  private

  def response_params
    params.require(:response).permit(:content)
  end
end
