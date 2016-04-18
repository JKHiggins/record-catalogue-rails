module API
  module V1
    class VinylRecordsController < ApplicationController
      before_action :load_vinyl_record, except: %i{index new create}
      skip_before_action :verify_authenticity_token

      def index
        render json: {"records" => VinylRecord.all}
      end

      def show
        render json: @vinyl_record
      end

      def create
        if vinyl_record = VinylRecord.create(pruned_attrs)
          msg = { :status => "ok", :message => "Success!", :object => {id: vinyl_record.id} }
        else
          msg = { :status => "failure", :message => "Failed to create record #{pruned_attrs}" }
        end

        render json: msg
      end

      def update
        updated_vinyl_record = @vinyl_record.update_attributes(pruned_attrs)

        render json: updated_vinyl_record
      end

      def destroy
        if @vinyl_record.destroy
          msg = { :status => "ok", :message => "Success!" }
        else
          msg = { :status => "failure", :message => "Failed to delete record #{params[:id]}" }
        end
        render json: msg
      end

      private

      def pruned_attrs
        {
          album: params[:album],
          artist: params[:artist],
          cost: params[:cost],
          genre: params[:genre]
        }
      end

      def load_vinyl_record
        @vinyl_record = VinylRecord.find(params[:id])

      rescue ActiveRecord::RecordNotFound
        render json: { :status => "failure", :message => "Record not found with id #{params[:id]}"}
      end
    end
  end
end
