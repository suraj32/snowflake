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
      user = User.find(params[:user_id])
      @role = Role.find_by(name: user.role)
      render json: RoleSerializer.serialize_with_tracks(@role)
    end

    def create_assessment
      user = User.find(params[:user_id])
      role = Role.find_by(name: user.role)
      assessment_result = user.assessment_results.create!(
                              total_points: params["Total points"],
                              current_level: params["Current level"],
                              points_to_next_level:
                               params["Points to next level"])
      assessment_data = params["Assessment Data"]
      for a in assessment_data
        track_category = TrackCategory.find_by(name: a["Track category"])
        track = track_category.tracks.find_by(name: a["Track"])
        level = track.levels.find_by(seq_no: a["Level"])
        assessment_result.level_assessments.create!(user_id: user.id,
                                                   role_id: role.id,
                                                   track_category_id: track_category,
                                                   track_id: track.id,
                                                   level_id: level.id,
                                                   )
      end
    end
  end
end