class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @user       = User.find session[:user_id]
    @assessment = Assessment.find params[:assessment_id]
    @items      = @assessment.items
    @level_ids =[]
    for level_id in @user.level.id..Level.find_by(name: 'expert').id
      @level_ids << level_id
    end
  end

  def handle_update
    puts "ZT! params="+params.inspect

    render nothing: true
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @assessment = Item.find(params[:id]).assessment
    puts "ZT! show: @assessment="+@assessment.inspect
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @assessment = Item.find(params[:id]).assessment
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Изменение успешно сохранено' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:assessment_id, :behavior_id, :user_tick, :final_tick)
    end
end
