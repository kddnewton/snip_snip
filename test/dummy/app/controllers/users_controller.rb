class UsersController < ApplicationController
  def action1
    @users = User.find_each { |user| access_fields(user) }
    head :ok
  end

  def action2
    @users = User.all.to_a
    head :ok
  end

  private

  def access_fields(user)
    [user.id, user.created_at, user.updated_at, user.first_name, user.last_name]
  end
end
