class ExamsController < ApplicationController
    before_action :set_exam, only: [:show]
    # before_action :require_login, only: [:new, :create]
    # # GET
    def index
    @exams = Exam.all
    end
  
    # GET
    def show
    end
  
    # GET
    def new
      @exam = Exam.new
    end
  
    # GET
    def edit
    end
  
    # POST /exams
   
    def create
      @exam = Exam.new(exam_params)
  
       if @exam.save
         redirect_to @exam, notice: 'exam was successfully created.' 
       else
         render :new, status: :unprocessable_entity 
       end
    end
  
    # PATCH/PUT /exams/1
    def update
      if @exam.update(exam_params)
          redirect_to @exam, notice: 'exam was successfully updated.' 
      else
          render :edit, status: :unprocessable_entity 
      end
    end
  
    # DELETE /exams/1
   
    def destroy
      @exam.destroy 
      if @exam.id == session[:exam_id]
        session[:exam_id] = nil
        redirect_to root_path, notice: 'exam was successfully destroyed.' 
      end
    end
  
    private
      def set_exam
        @exam = Exam.find(params[:id])
      end
  
      def exam_params
        params.require(:exam).permit(:subject,:total_marks,:per_que_mark,:time_duration) 
      end
end
