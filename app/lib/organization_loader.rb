require 'csv'

##
# This class reads in the data from the .csv file located at
# data/organization_sample_data.csv
# and populates the organizations database table
class OrganizationLoader

  FILE_PATH = 'data/organization_sample_data.csv'
  ERRORS_PATH = 'data/import_errors'

  def self.run
    @errors = []
    CSV.read(FILE_PATH, { headers: true, header_converters: :symbol }).each do |row|
      build_organization(row)
    end
    write_errors unless Rails.env.test?
  end

  def self.build_organization(row)
    o = Organization.new
    o.id = row[:id].to_i
    o.name = normalize(row[:name])
    o.city = normalize(row[:city])
    o.state = normalize(row[:state])
    o.postal_code = normalize(row[:postal])
    o.category = normalize(row[:category])
    o.save!
  rescue ActiveRecord::RecordInvalid => e
    @errors << "[#{e.message}] #{row.inspect}"
  end

  def self.normalize(value)
    return nil if value == "NULL"
    value.strip.titleize
  end

  def self.write_errors
    File.open(ERRORS_PATH, 'w') do |file|
      @errors.each do |error|
        file.write(error + "\n")
      end
    end
  end

end