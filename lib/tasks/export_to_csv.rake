require "csv"

namespace :export do
  desc "Export all tables to CSV files"
  task all: :environment do
    puts "Starting export..."  # Debugging output

    # List all ActiveRecord models
    tables = [ "fitments" ] # ActiveRecord::Base.connection.tables
    puts "Tables found: #{tables.join(', ')}"  # Debugging output

    tables.each do |table_name|
      model_name = table_name.classify.constantize  # Dynamically get the model class

      puts "Processing #{model_name}..."  # Debugging output

      csv_file_path = "#{Rails.root}/tmp/#{table_name}.csv"

      records = model_name.all

      puts "#{records.count} records found for #{model_name}."  # Debugging output

      if records.empty?
        puts "No records found for #{model_name}."
        next
      end

      CSV.open(csv_file_path, "w") do |csv|
        # Write the headers
        csv << model_name.column_names

        # Write each row
        records.find_each do |record|
          csv << record.attributes.values
        end
      end

      puts "Exported #{table_name} to #{csv_file_path}"
    end

    puts "Export completed!"  # Debugging output
  end
end
