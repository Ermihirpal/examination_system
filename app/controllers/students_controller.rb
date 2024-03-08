class StudentsController < ApplicationController
  # rescue_from ActiveRecord::RecordNotFound, with: :invalid_student
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:new, :create]


  def index
  @students = Student.all
  end


  def show
  end


  def new
    @student = Student.new
  end


  def edit
  end

  
 
  def create
    @student = Student.new(student_params)

     if @student.save
       redirect_to @student, notice: 'student was successfully created.' 
     else
       render :new, status: :unprocessable_entity 
     end
  end


  def update
    if @student.update(student_params)
        redirect_to @student, notice: 'student was successfully updated.' 
    else
        render :edit, status: :unprocessable_entity 
    end
  end

 
  def destroy
    @student.destroy 
    if @student.id == session[:student_id]
      session[:student_id] = nil
      redirect_to root_path, notice: 'student was successfully destroyed.' 
    end
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name,:email,:phone_number,:address,:password) 
    end

    def invalid_student
      redirect_to root_path, notice: "That student doesn't exist"
    end

  end