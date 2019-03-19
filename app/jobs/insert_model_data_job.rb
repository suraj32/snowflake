require 'csv'

class InsertModelDataJob < ApplicationJob
  queue_as :default

  def perform(upload_id)
    upload = Upload.find(upload_id)
    input_csv = CSV.open(upload.file.path, headers: true)
    type_of_file = upload.type_of_file
    case type_of_file
    when 'Roles'
      csv_report = insert_roles(upload, input_csv)
    when 'Track Categories'
      csv_report = insert_track_categories(upload, input_csv)
    when 'Tracks'
      csv_report = insert_tracks(upload, input_csv)
    when 'Levels'
      csv_report = insert_levels(upload, input_csv)
    end
    UserMailer.with(content: csv_report).send_csv_report.deliver_now
  end

  def insert_roles(upload, input_csv)
    csv_report = CSV.generate do |new_csv|
      new_csv << ['Name', 'Status']
      input_csv.each do |row|
        role = Role.create(name: row["Name"])
        if role.errors.messages == {}
          new_csv << [row["Name"], "Inserted"]
        else
          new_csv << [ row["Name"], "Name #{role.errors.messages[:name].join}" ]
        end
      end
    end
    csv_report
  end

  def insert_track_categories(upload, input_csv)
    role = Role.find(upload.role)
    csv_report = CSV.generate do |new_csv|
      new_csv << ['Name', 'Description', 'Status']
      input_csv.each do |row|
        track_category = role.track_categories.create(name: row["Name"], 
          description: row["Description"])
        if track_category.errors.messages == {}
          new_csv << [row["Name"], row["Description"], "Inserted"]
        else
          new_csv << [row["Name"], row["Description"],
           "Name #{track_category.errors.messages[:name].join}"]
        end
      end
    end
    csv_report
  end

  def insert_tracks(upload, input_csv)
    track_category = TrackCategory.find(upload.track_category)
    csv_report = CSV.generate do |new_csv|
      new_csv << ['Name', 'Description', 'Status']
      input_csv.each do |row|
        track = track_category.tracks.create(name: row["Name"], 
          description: row["Description"])
        if track.errors.messages == {}
          new_csv << [row["Name"], row["Description"], "Inserted"]
        else
          new_csv << [row["Name"], row["Description"],
           "Name #{track.errors.messages[:name].join}"]
        end
      end
    end
    csv_report
  end

  def insert_levels(upload, input_csv)
    track = Track.find(upload.track)
    csv_report = CSV.generate do |new_csv|
      new_csv << ['Seq. No', 'Description', 'Example behaviour',
       'Example task', 'Status']
      input_csv.each do |row|
        level = track.levels.create(seq_no: row["Seq. No"],
          description:       row["Description"],
          example_behaviour: row["Example behaviour"].split(/\s*,\s*/),
          example_task:      row["Example task"].split(/\s*,\s*/))
        if level.errors.messages == {}
          new_csv << [
            row["Seq. No"],
            row["Description"],
            row["Example behaviour"],
            row["Example task"],
            "Inserted"]
        else
          new_csv << [
            row["Seq. No"],
            row["Description"],
            row["Example behaviour"],
            row["Example task"],
            "Seq. no #{level.errors.messages[:seq_no].join}"]
        end
      end
    end
    csv_report
  end
end