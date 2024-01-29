class AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :authorize_admin, only: [:edit, :update]

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to @admin, notice: 'Admin created successfully.'
    else
      render :new
    end
  end

  def edit
    @admin = current_admin
  end

  def update
    @admin = current_admin
    if @admin.update(admin_params)
      redirect_to admin_path, notice: 'Admin updated successfully.'
    else
      render :edit
    end
  end

  def authorize_admin
  redirect_to root_path unless current_admin.can_edit_other_admins?
  end

private

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  end

end
