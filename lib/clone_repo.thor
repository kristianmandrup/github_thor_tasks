require 'thor/group'
require 'octopi'

module Github 
  module Repository
    class Clone  < Thor::Group
      include Thor::Actions
      include Octopi

      # Define arguments 
      argument :user_name, :type => :string, :required => true, :desc => 'name of github user'
      argument :name, :type => :string, :required => true, :desc => 'name of repository to create'
  
      def clone_repo           
        repository = Repository.find(:user => user_name, :name => name) 
        if !repository
          say "Repository #{user_name}/#{name} not found", :red
          return
        end
        run("git clone #{repository.clone_url}")
      end
  
    end
  end
end                  
