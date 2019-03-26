class Upload
  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  mount_uploader :input_file, ModelDataUploader
  mount_uploader :csv_report, ReportUploader
  field :type_of_file, type: String

  belongs_to :role, optional: true
  belongs_to :track_category, optional: true
  belongs_to :track, optional: true

  validates :type_of_file, presence: true
  validates :input_file,   presence: true
  
  validates :role, presence: true, if: :file_type_track_categories?
  validates :role, :track_category, presence: true, if: :file_type_tracks?
  validates :role, :track_category, :track, presence: true,
   if: :file_type_levels?

  def file_type_track_categories?
    type_of_file == 'Track Categories'
  end

  def file_type_tracks?
    type_of_file == 'Tracks'
  end

  def file_type_levels?
    type_of_file == 'Levels'
  end
end