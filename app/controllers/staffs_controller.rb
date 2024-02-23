# frozen_string_literal: true

class StaffsController < ApplicationController
  before_action :set_staff, only: %i[show edit update destroy]

  # GET /staffs or /staffs.json
  def index
    @staffs = Staff.order('created_at DESC').first(20)
  end

  # GET /staffs/1 or /staffs/1.json
  def show; end

  # GET /staffs/new
  def new
    @staff = Staff.new
  end

  # GET /staffs/1/edit
  def edit; end

  # POST /staffs or /staffs.json
  def create
    @staff = Staff.new(staff_params)

    if @staff.save
      flash.now[:notice] = 'Staff was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /staffs/1 or /staffs/1.json
  def update
    if @staff.update(staff_params)
      flash.now[:notice] = 'Staff was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /staffs/1 or /staffs/1.json
  def destroy
    @staff.destroy!

    flash.now[:notice] = 'Staff was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_staff
    @staff = Staff.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def staff_params
    params.require(:staff).permit(:name, :age)
  end
end
