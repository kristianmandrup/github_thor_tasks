require 'thor/group'
require 'octopi'

module Github
  module Repository
    class Delete < Thor::Group
      include Thor::Actions
      include Octopi      

      # Define arguments 
      argument :name, :type => :string, :required => true, :desc => 'name of repository to delete'
  
      def delete_repo  
        authenticated do                 
          repo_options = {:name => name}      
          Repository.delete(repo_options)
        end
      end
    end  
  end    
end                  
