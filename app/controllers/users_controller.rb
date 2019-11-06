class UsersController < ApplicationController
    before_action :authenticate_user!
     def show
        redirect_to "https://www.github.com"
     end
     def create
        puts "you have signed in"
      end
end