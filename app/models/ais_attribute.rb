class AisAttribute < ActiveRecord::Base
  attr_accessible :application_number, :application_term, :name, :banner_pidm

  validates :application_number, :application_term, :name, :banner_pidm, presence: true

  # BANNERPIDM^APPLICATIONTERM^APPLICATIONNUMBER^ATTRIBUTE
  def self.import(file, terms = [])
    spreadsheet = open_spreadsheet(file)
    header = ["banner_pidm", "application_term", "application_number", "name"]
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      record = new
      record.attributes = row.to_hash.slice(*accessible_attributes)
      record.save! if terms.include?(record.application_term)
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename).downcase
      when ".csv" then Roo::Csv.new(file.path, csv_options: {col_sep: "^"})
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else 
       raise "Unknown file type: #{file.original_filename}"
    end
  end

end
