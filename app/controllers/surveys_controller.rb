class SurveysController < ApplicationController

  before_action :authenticate_user!

  def index
    @surveys= Survey.all
  end

  def new
    @survey = Survey.new
    @survey.questions.build
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(survey_params)
      redirect_to @survey
    else
      render :edit
    end
  end

  def create
    @survey = Survey.create(survey_params)
    if @survey.save
      redirect_to surveys_path
    else
      render 'new'
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_path
  end

  def take_survey
    @survey = Survey.find(params[:id])
  end

  def submit_survey
    params[:survey][:responses].each do |key, val|
      res = Response.new(question_id: val["question_id"], response:val["response"])
      res.save!
    end
    redirect_to surveys_path
  end

  private
  def survey_params
    params.require(:survey).permit(:name, :description, questions_attributes:[:id, :name, :_destroy, responses_attributes: [:response]])
  end

end

