class AdminsBackOfficeController < ApplicationController
  layout 'admins_back_office'
  before_action :authenticate_admin!
end
