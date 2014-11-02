class NewspapersController < ApplicationController
  load_and_authorize_resource
  before_action :set_newspaper, only: [:show, :edit, :update, :destroy]
  skip_before_action :set_newspaper, only: [:feed_rss, :new, :create]


require 'rss'
require 'open-uri'

  # GET /newspapers
  # GET /newspapers.json
  def index
    @newspapers = Newspaper.all.order("created_at DESC")

    if $client != nil
      n = Newspaper.new
      @retrieveTweetFromAccountUCPCergy = n.retrieveTweetFromAccountUCPCergy
      @retrieveTweetFromAccountRPUCP = n.retrieveTweetFromAccountRPUCP
      @retrieveTweetFromAccountUCPAssoLide = n.retrieveTweetFromAccountUCPAssoLide
    end
    
    #display rss
    feed_url = "http://www.u-cergy.fr/_plugins/web/www/fr/filter/org.ametys.web.new.RSS.accueil/rss.xml"
    #@output = Array.new(10)
    open(feed_url) do |http|
      response = http.read
      @result = RSS::Parser.parse(response, false)
      #sort rss feed by desc
      @result.items.sort! { |x,y| y.pubDate <=> x.pubDate } 
    end
  end

  # GET /newspapers/1
  # GET /newspapers/1.json
  # Show the newspapers from the id parameter
  def show_by_cat
    @newspapers = Newspaper.where("id_categories = ?", params[:id])
  end

  # GET /newspapers/new
  def new
    @newspaper = Newspaper.new
  end

  # GET /newspapers/1/edit
  def edit
  end

  #GET /feedrss/
  def feed_rss
    @feednews = Newspaper.select("title, description, author,created_at, updated_at").order("updated_at DESC").all()
    respond_to do |format|
      format.html
        format.atom { render layout: false }
    end
  end

  # POST /newspapers
  # POST /newspapers.json
  def create
    @newspaper = Newspaper.new(newspaper_params)

    respond_to do |format|
      if @newspaper.save
        format.html { redirect_to @newspaper, notice: 'Newspaper was successfully created.' }
        format.json { render :show, status: :created, location: @newspaper }
      else
        format.html { render :new }
        format.json { render json: @newspaper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newspapers/1
  # PATCH/PUT /newspapers/1.json
  def update
    respond_to do |format|
      if @newspaper.update(newspaper_params)
        format.html { redirect_to @newspaper, notice: 'Newspaper was successfully updated.' }
        format.json { render :show, status: :ok, location: @newspaper }
      else
        format.html { render :edit }
        format.json { render json: @newspaper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newspapers/1
  # DELETE /newspapers/1.json
  def destroy
    @newspaper.destroy
    respond_to do |format|
      format.html { redirect_to newspapers_url, notice: 'Newspaper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newspaper
      @newspaper = Newspaper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newspaper_params
      params.require(:newspaper).permit(:title, :description, :author, :rating, :id_categories)
    end
end
