class Company < ActiveRecord::Base
  attr_accessible :name, :start_of_operations, :end_of_operations

  has_quality_tests do
    quality_test '01', :method_name => :not_empty, :attr => :name
    quality_test '02',  :method_name => :not_empty, :attr => :start_of_operations
    quality_test '03', :method_name => :not_empty, :attr => :end_of_operations, :if => lambda {|company| !company.start_of_operations.blank?}
    quality_test '04', :method_name => :each_not_empty, :attr => :employed_since, :function => :people
    quality_test '05', :description => "Company.end_of_operations is later than Company.start_of_operations", :if => lambda {|company| !company.start_of_operations.blank? and !company.end_of_operations.blank?} do |company|
      company.start_of_operations < company.end_of_operations
    end
    quality_test '06', :method_name => :not_expired, :since => 1.year.ago, :attr => :updated_at
  end

  has_many :people
end
