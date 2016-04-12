module API
  module V1
    class VinylRecordsController < ApplicationController
      def index
        render json: {foo: "bar"}
      end
      #add other routes!!!
    end
  end
end
