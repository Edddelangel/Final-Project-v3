namespace :slurp do
  desc "TODO"
  task transactions: :environment do
  
      require "csv"

      csv_text = File.read(Rails.root.join("lib", "csvs", "transactions.csv"))
      csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
      csv.each do |row|
        t = Transaction.new
        t.project_name = row["project_name"]
        t.industry = row["industry"]  
        t.description = row["description"]
        t.instrument = row["instrument"]
        t.years = row["years"]
        t.return = row["return"]
        t.required_funding = row["required_funding"]
        t.entrepreneur_id = row["entrepreneur_id"]
        t.save
        puts "#{t.project_name}, #{t.industry} saved"
      end
  end

  task investors: :environment do
 
    require "csv"

        csv_text = File.read(Rails.root.join("lib", "csvs", "investors.csv"))
        csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
        csv.each do |row|
          t = Investor.new
          t.first_name = row["first_name"]
          t.last_name = row["last_name"]  
          t.email = row["email"]
          t.mobile = row["mobile"]
          t.save
          puts "#{t.first_name}, #{t.last_name} saved"
        end
  end

  task entrepreneurs: :environment do
 
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "entrepreneurs.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = Entrepreneur.new
      t.first_name = row["first_name"]
      t.last_name = row["last_name"]  
      t.email = row["email"]
      t.mobile = row["mobile"]
      t.save
      puts "#{t.first_name}, #{t.last_name} saved"
    end
  end  

end
