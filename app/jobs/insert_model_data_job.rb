require 'csv'

class InsertModelDataJob < ApplicationJob
  queue_as :default

  def perform(upload_id)
    upload          = Upload.find(upload_id)
    input_csv       = CSV.open(upload.input_file.path, headers: true)
    tmp_report_path = Rails.root.join('public', 'uploads', 'tmp',
     "#{File.basename(upload.input_file.path).split('.')[0]+'_report.csv'}")
    type_of_file = upload.type_of_file
    csv_report =  case type_of_file
    when 'Roles'
      insert_roles(upload, input_csv, tmp_report_path)
    when 'Track Categories'
      insert_track_categories(upload, input_csv, tmp_report_path)
    when 'Tracks'
      insert_tracks(upload, input_csv, tmp_report_path)
    when 'Levels'
      insert_levels(upload, input_csv, tmp_report_path)
    end
    upload.csv_report = CSV.open(tmp_report_path)
    File.delete(tmp_report_path)
    upload.save
  end

  def insert_roles(upload, input_csv, tmp_report_path)
    csv_report = CSV.open(tmp_report_path, 'w') do |new_csv|
      new_csv << ['Role name', 'Status']
      input_csv.each do |row|
        role = Role.create(name: row["Role name"])
        if role.errors.any?
          new_csv << [ 
            row["Role name"], 
            "Name #{role.errors.full_messages}" 
          ]
        else
          new_csv << [row["Role name"], "Inserted"]
        end
      end
    end
    csv_report
  end

  def insert_track_categories(upload, input_csv, tmp_report_path)
    role       = Role.find(upload.role)
    csv_report = CSV.open(tmp_report_path, 'w') do |new_csv|
      new_csv << ['Track category name', 'Description', 'Status']
      input_csv.each do |row|
        track_category = role.track_categories.create(name: row["Track category name"], 
          description: row["Description"])
        if track_category.errors.any?
          new_csv << [
            row["Track category name"], 
            row["Description"],
           "Name #{track_category.errors.full_messages}"
         ]
        else
          new_csv << [
            row["Track category name"], 
            row["Description"], 
            "Inserted"
          ]
        end
      end
    end
    csv_report
  end

  def insert_tracks(upload, input_csv, tmp_report_path)
    track_category = TrackCategory.find(upload.track_category)
    csv_report     = CSV.open(tmp_report_path, 'w') do |new_csv|
      new_csv << ['Track name', 'Description', 'Status']
      input_csv.each do |row|
        track = track_category.tracks.create(name: row["Track name"], 
          description: row["Description"])
        if track.errors.messages.any?
          new_csv << [
            row["Track name"], 
            row["Description"],
           "Name #{track.errors.full_messages}"
         ]
        else
          new_csv << [row["Track name"], row["Description"], "Inserted"]
        end
      end
    end
    csv_report
  end

  def insert_levels(upload, input_csv, tmp_report_path)
    track = Track.find(upload.track)
    csv_report = CSV.open(tmp_report_path, 'w') do |new_csv|
      new_csv << ['Seq. no.', 
        'Description', 
        'Example behaviour',
        'Example task', 'Status']
      input_csv.each do |row|
        level = track.levels.create(
          seq_no:            row["Seq. no."],
          description:       row["Description"],
          example_behaviour: row["Example behaviour"].split(/\s*,\s*/),
          example_task:      row["Example task"].split(/\s*,\s*/)
        )
        if level.errors.any?
          new_csv << [
            row["Seq. no."],
            row["Description"],
            row["Example behaviour"],
            row["Example task"],
            "Seq. no #{level.errors.full_messages}"
          ]
        else
          new_csv << [
            row["Seq. no."],
            row["Description"],
            row["Example behaviour"],
            row["Example task"],
            "Inserted"
          ]
        end
      end
    end
    csv_report
  end
end