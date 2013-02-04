class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all.sort_by(&:date).reverse
    @nextevents = Event.all(:conditions => ["date >= ?", Time.new]).sort_by(&:date).reverse
    @previousevents = Event.all(:conditions => ["date < ?", Time.new]).sort_by(&:date).reverse
    @sports_list = Sport.select('name').all.map(&:name)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @prueba = Event.first
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    if signed_in? && current_user.id == @event.user_id
      respond_to do |format|
        if @event.save
          format.html { redirect_to @event, notice: 'Event was successfully created.' }
          format.json { render json: @event, status: :created, location: @event }
        else
          format.html { render action: "new" }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "You must be logged in."
      sign_out
      redirect_to signin_path
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    if signed_in? && current_user.id == @event.user_id
      respond_to do |format|
        if @event.update_attributes(params[:event])
          format.html { redirect_to @event, notice: 'Event was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "You must be logged in."
      sign_out
      redirect_to signin_path
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    if signed_in? && current_user.id == @event.user_id
      @event.destroy

      respond_to do |format|
        format.html { redirect_to events_url }
        format.json { head :no_content }
      end
    else
      flash[:error] = "You must be logged in."
      sign_out
      redirect_to signin_path
    end
  end

  def join
    userevent = UserEvent.new(:user_id => current_user.id, :event_id => params[:id])
    if userevent.save
      respond_to do |format|
        format.html { redirect_to root_url + 'events/' + params[:id].to_s }
        format.js { render :nothing => true }
      end
    end

  end

end
