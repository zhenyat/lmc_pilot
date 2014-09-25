class DatashowController < ApplicationController
  layout 'datashow'

  def behavior
    @position    = Position.find_by_name(params['position_name'])
    @competency  = Competency.find(params['competency_id'])
    @cluster     = Cluster.find @competency.cluster_id
    @levels      = Level.all
    @behaviors   = Hash.new
    @actioncard  = Hash.new
    @levels.each do |level|
      @behaviors[level.name]  = Behavior.where(competency_id: @competency.id, level_id: level.id)
      @actioncard[level.name] = Actioncard.where(competency_id: @competency.id).find_by_level_id(level.id)
    end
  end
end
