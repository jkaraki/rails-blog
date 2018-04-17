class UserSessionsController < ApplicationController
  def new

  end

  def create
    # puts '**************************'
    # puts params.inspect
    # puts '**************************'

    if login(params[:email], params[:password])
      redirect_back_or_to(posts_path, notice: 'Login successful')
    else
      flash.now.alert = "Login failed."
      render action: :new
    end
  end

  def destroy
    puts '**************************'
    puts params.inspect
    puts '**************************'
    reset_session
    redirect_to(posts_path, notice: "Logged out")
  end
end
