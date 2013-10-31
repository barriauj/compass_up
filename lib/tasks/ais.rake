namespace :ais do
  
  desc "Update AIS Tables"
  task :update => [:environment, :clean, :import]
  
  task :clean => [:clean_ais_application_comments, :clean_ais_attributes, :clean_ais_checklists, :clean_ais_info_items]
  
  task :import => [:import_ais_application_comments, :import_ais_attributes, :import_ais_checklists, :import_ais_info_items]
  
  task :clean_ais_application_comments do
    puts "Deleting data from ais_application_comments"
    AisApplicationComment.delete_all
  end
  
  task :clean_ais_attributes do
    puts "Deleting data from ais_attributes"
    AisAttribute.delete_all
  end
  
  task :clean_ais_checklists do
    puts "Deleting data from ais_checklists"
    AisChecklist.delete_all
  end
  
  task :clean_ais_info_items do
    puts "TODO: Deleting data from ais_info_items"
    # AisInfoItem.delete_all
  end
  
  task :import_ais_application_comments do
    puts "Importing to ais_application_comments"
    path = "#{Rails.root}/downloads/GV_SIS_APPLICATIONCOMMENTS.CSV"
    spreadsheet = Roo::Csv.new(path, csv_options: {col_sep: "^"})
    header = ["banner_pidm", "application_term", "application_number", "originator", "comment"]
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      record = AisApplicationComment.new
      record.attributes = row.to_hash
      record.save!
    end    
  end
  
  task :import_ais_attributes do
    puts "Importing to ais_attributes"
    path = "#{Rails.root}/downloads/GV_SIS_ATTRIBUTES.CSV"
    spreadsheet = Roo::Csv.new(path, csv_options: {col_sep: "^"})
    header = ["banner_pidm", "application_term", "application_number", "name"]
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      record = AisAttribute.new
      record.attributes = row.to_hash
      record.save!
    end    
  end
  
  task :import_ais_checklists do
    puts "Importing to ais_checklists"
    path = "#{Rails.root}/downloads/GV_SIS_CHECKLISTS.CSV"
    spreadsheet = Roo::Csv.new(path, csv_options: {col_sep: "^"})
    header = ["banner_pidm", "application_term", "application_number", "requirement_code", "received_date", "item", 
      "item_description", "ckst_code", "mandatory"]
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      record = AisChecklist.new
      record.attributes = row.to_hash
      record.save!
    end    
  end
  
  task :import_ais_info_items do
    puts "TODO: Importing to ais_info_items"
    # path = "#{Rails.root}/downloads/GV_SIS_INFO.csv"
    # spreadsheet = Roo::Csv.new(path, csv_options: {col_sep: "^"})
    # header = ["banner_pidm", "application_term", "application_number", "originator", "comment"]
    # (2..spreadsheet.last_row).each do |i|
    #   row = Hash[[header, spreadsheet.row(i)].transpose]
    #   record = AisInfoItem.new
    #   record.attributes = row.to_hash
    #   record.save!
    # end    
  end
  
end