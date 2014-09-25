class PagesController < ApplicationController
  def help
  end

  def home
    @user = User.find session[:user_id]
  end

  # To show Competencies Matrix
  def review
    @clusters  = Cluster.all
#    @positions = Position.all.pluck(:title)
    @positions = Position.where('name IN (?)', ['seller', 'senior_seller', 'sector_head', 'store_director'])
    @matrix    = Hash.new

    @clusters.each do |cluster|
      @matrix[cluster.name] = {}
      competency_names = Competency.where(cluster_id: cluster.id).pluck('DISTINCT name')
      competency_names.each do |competency_name|
        @matrix[cluster.name][competency_name] = []
        competencies = Competency.where(name: competency_name)
        competencies.each do |competency|
#          if cluster.mutual?
#            @matrix[cluster.name][competency.name][competency.position.id] = 'MMM'
#          else
            @matrix[cluster.name][competency.name][competency.position.id] = competency.position.name
#          end
        end
      end
    end
  end
end
