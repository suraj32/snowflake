class Upload
  include Mongoid::Document
  mount_uploader :file, ModelDataUploader
  field :type_of_file, type: String

  belongs_to :role, optional: true
  belongs_to :track_category, optional: true
  belongs_to :track, optional: true

  validates :file, presence: true
  validates :role, presence: true, if: :file_type_roles?
  validates :track_category, presence: true, if: :file_type_track_categories?
  validates :track, presence: true, if: :file_type_tracks?

  def file_type_roles?
  	type_of_file == 'Roles'
  end

  def file_type_track_categories?
  	type_of_file == 'Track Categories'
  end

  def file_type_tracks?
   	type_of_file == 'Tracks'
  end 
end