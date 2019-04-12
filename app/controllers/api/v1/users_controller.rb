module Api::V1
  class UsersController < ApiController
    skip_before_action :verify_authenticity_token

    def index
      render json: User.all
    end

    # def start_assessment
    #   @user = User.find(request.headers[:HTTP_AUTHORIZATION])
    #   get_static_data(@user)
    # end

    def get_static_data
      if params[:user_id]
        user = User.find(params[:user_id])
        role = Role.find_by(name: user.role)
        render json: role, include: ['track_categories', 'track_categories.tracks', 'track_categories.tracks.levels']
      else
        roles = Role.all
        render json: roles, include: ['track_categories', 'track_categories.tracks', 'track_categories.tracks.levels']
      end
    end

    def create_assessment
      cycle = Cycle.find_by(is_open: true)
      if cycle && (Date.today <= cycle.emp_duration_end)
        user = User.find(params[:user_id])
        role = Role.find(params[:role_id])
        assessment_result = AssessmentResult.create(
                          total_points:         params[:total_points],
                          current_level:        params[:current_level],
                          points_to_next_level: params[:points_to_next_level],
                          cycle_id:             cycle.id,
                          user_id:              user.id)
        track_categories = params[:track_categories]
        for track_category in track_categories
          track_category_id = TrackCategory.find(track_category[:track_category_id]).id
          tracks = track_category[:tracks]
          for track in tracks
            track_id = Track.find(track[:track_id]).id
            level_id = Level.find(track[:level_id]).id
            assessment_result.level_assessments.create(
                        user_id:           user.id,
                        role_id:           role.id,
                        track_category_id: track_category_id,
                        track_id:          track_id,
                        level_id:          level_id,
                        cycle_id:          cycle.id)
          end
        end
        render json: {message: 'Assessment saved successfully'}, status: 201
      else
        render json: {errors: 'Sorry, U can only create assessment in allowed time'},
                      status: 412
      end
    end

    def get_assessment
      cycle = Cycle.find_by(is_open: true)
      user = User.find(params[:user_id])
      assessment_result = cycle.assessment_results.find_by(user_id: user.id)
      render json: assessment_result
    end
    
    def update_assessment
      cycle = Cycle.find_by(is_open: true)
      if cycle && (Date.today <= cycle.manager_duration_end)
        updated_levels = params[:updated_levels]
        for updated_level in updated_levels
          level_assessment = LevelAssessment.find(updated_level[:level_assessment_id])
          level = Level.find(updated_level[:level_id])
          level_assessment.level_id = level.id
        end
        render json: {message: 'Assessment updated successfully'}, status: 201
      else
        render json: {errors: 'Sorry, U can only update assessment in allowed time'},
                      status: 412
      end
    end

  end
end