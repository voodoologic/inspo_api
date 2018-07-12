class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :update, :destroy]

  # GET /votes
  def index
    @votes = Vote.all

    render jsonapi: @votes
  end

  # GET /votes/1
  def show
    render jsonapi: @vote
  end

  # POST /votes
  def create
    vote_attrs = { }
    vote_attrs[:voter_id] = params.dig('_jsonapi', 'data', 'relationships' , 'voter', 'data', 'id')
    vote_attrs[:candidate_id] = params.dig('_jsonapi', 'data', 'relationships' , 'candidate', 'data', 'id')
    @vote = Vote.new(vote_attrs)

    if @vote.save
      render jsonapi: @vote, status: :created, location: @vote
    else
      render jsonapi: @vote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /votes/1
  def update

    if @vote.update(vote_params)
      render jsonapi: @vote
    else
      render jsonapi: @vote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /votes/1
  def destroy
    @vote.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vote_params
      params.dig('_jsonapi', 'data', 'relationships' , 'voter', 'data').permit('id')
      params.dig('_jsonapi', 'data', 'relationships' , 'candidate', 'data').permit('id')
    end
end
