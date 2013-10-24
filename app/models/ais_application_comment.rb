class AisApplicationComment < ActiveRecord::Base
  attr_accessible :application_number, :application_term, :banner_pidm, :comment, :originator

  # BannerPIDM^ApplicationTerm^ApplicationNumber^Originator^Comment
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = ["banner_pidm", "application_term", "application_number", "originator", "comment"]
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      record = new
      record.attributes = row.to_hash.slice(*accessible_attributes)
      record.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename).downcase
    when ".csv" then Roo::Csv.new(file.path, csv_options: {col_sep: "^"})
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
