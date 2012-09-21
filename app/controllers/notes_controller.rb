class NotesController < ApplicationController
  before_filter :find_notebook
  # GET /notes
  # GET /notes.json
  def index
    @notes = @notebook.notes.all
    render json: @notes
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @note = Note.find(params[:id])

    render json: @note
  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    @note = @notebook.notes.new
    render json: @note
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = @notebook.notes.new(params[:note])

    if @note.save
      render json: @note, status: :created
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    @note = Note.find(params[:id])

    if @note.update_attributes(params[:note])
      head :no_content
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    head :no_content
  end

protected

  def find_notebook
    @notebook = Notebook.find params[:notebook_id]
  end
end
