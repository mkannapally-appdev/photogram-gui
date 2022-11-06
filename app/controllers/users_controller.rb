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

end