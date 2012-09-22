class NotebooksController < ApplicationController
  before_filter :authenticate_user!
  # GET /notebooks
  # GET /notebooks.json
  def index
    @notebooks = Notebook.all
    render json: @notebooks
  end

  # GET /notebooks/1
  # GET /notebooks/1.json
  def show
    @notebook = Notebook.find(params[:id])
    render json: @notebook
  end

  # GET /notebooks/new
  # GET /notebooks/new.json
  def new
    @notebook = Notebook.new
    render json: @notebook
  end

  # GET /notebooks/1/edit
  def edit
    @notebook = Notebook.find(params[:id])
  end

  # POST /notebooks
  # POST /notebooks.json
  def create
    @notebook = Notebook.new(params[:notebook])

    if @notebook.save
      render json: @notebook, status: :created, location: @notebook
    else
      render json: @notebook.errors, status: :unprocessable_entity
    end
  end

  # PUT /notebooks/1
  # PUT /notebooks/1.json
  def update
    @notebook = Notebook.find(params[:id])

      if @notebook.update_attributes(params[:notebook])
        head :no_content
      else
        render json: @notebook.errors, status: :unprocessable_entity
      end
  end

  # DELETE /notebooks/1
  # DELETE /notebooks/1.json
  def destroy
    @notebook = Notebook.find(params[:id])
    @notebook.destroy
    head :no_content
  end
end
