class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  # before_action :require_login, only: [:new, :create]

  
  def index
    @questions = Question.all
  end

  
  def show
  end

  
  def new
    @question = Question.new
    @questions = Question.where(exam_id:params[:exam_id])
  end

  
  def edit
  end

  
 
  def create
    # begin
     @exam = Exam.find(params[:exam_id])
     @total_marks = 0

      if params[:questions].present?
       
        params[:questions].each do |key, value|
       
          response = Response.new(question_id: key, ans: value["option_id"], student_id: session[:user_id])
          @student = Student.find_by(id:session[:user_id])
          
          # respond_to do |format|
            if response.save
            
              # UserMailer.with(student: @student).welcome_email().deliver_now
              option = Option.find_by(question_id: key, id: value["option_id"])

               if option&.is_correct
                  @total_marks += @exam.per_que_mark
                 
                end

            end
              # format.html {redirect_to(@student, notice: 'User response was successfully submited.') } 
          # end

        end
        UserMailer.welcome_email(@total_marks,@student).deliver_now
        # format.html {redirect_to(@student, notice: 'User response was successfully submited.') }
        redirect_to root_path, notice: 'User response was successfully submited.'                             
      else
         flash[:notice] = "no question present"
      end

    #   rescue => exception
    #     flash[:error] = exception.message
    #     redirect_to exams_path     
    # end 
  end


  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
        redirect_to @question, notice: 'question was successfully updated.' 
    else
        render :edit, status: :unprocessable_entity 
    end
  end

  # DELETE /questions/1
 
  def destroy
    @question.destroy 
    if @question.id == session[:question_id]
      session[:question_id] = nil
      redirect_to root_path, notice: 'question was successfully destroyed.' 
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:que) 
    end
    def question_params
      params.require(:option).permit(:option_val) 
    end

    # def invalid_question
    #   redirect_to root_path, notice: "That question doesn't exist"
    # end

  end

