class AssessmentResultsController < ApplicationController
  def index
    @assessment_results = AssessmentResult.all
  end
end
