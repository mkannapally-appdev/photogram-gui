class UsersController < ApplicationController


  def index

    matching_users = User.all
    @list_of_users = matching_users.order({:username => :asc})

    render ({:template => "user_templates/index.html.erb"})
  end

  def show
    username = params.fetch("username")
    
    matching_usernames = User.all.where(:username => username)

    @the_user = matching_usernames.first

    render({:template => "user_templates/show.html.erb"})
  end

  def create

    new_user_name = params.fetch("query_user")

    new_user = User.new
    new_user.username = new_user_name

    new_user.save
    
    redirect_to ("/users/" + new_user_name)

  end

  def update

    updated_username = params.fetch("query_user")

    username = params.fetch("username")

    matching_usernames = User.all.where(:username => username)

    @the_user = matching_usernames.first

    @the_user.username = updated_username

    @the_user.save
    
    redirect_to ("/users/" + updated_username)

  end

end
