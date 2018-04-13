class TaggingsController < ApplicationController
  def tags
    @tag = Tagging.find(params[:id])
  end
end
