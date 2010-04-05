require 'thor/group'
require 'octopi'

module Github 
  module Repository
    class Create < Thor::Group
      include Thor::Actions
      include Octopi      

      # Define arguments 
      argument :name, :type => :string, :required => true, :desc => 'name of repository to create'

      # Define options
      class_option :description, :type => :string, :aliases => '-desc', :desc => 'name of repository'
      class_option :homepage, :type => :string, :aliases => '-home', :desc => 'homepage location'
      class_option :private, :type => :boolean, :aliases => '-priv', :default => false, :desc => 'create a private repo'
  
      def create_repo           
        authenticated do
          repo_options = {:name => name}
          [:description, :homepage ].each{|o| repo_options[o] = options[o] if options[o]}
          repo_options[:public] = 0 if options[:private]                

          Repository.create(repo_options)               
        end
      end
  
    end
  end
end                  
