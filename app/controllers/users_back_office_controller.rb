class UsersBackOfficeController < ApplicationController
  layout "users_back_office"
  before_action :authenticate_user!
end
