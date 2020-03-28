module Api
  module V1
    class ConsumersController < ApplicationController

      def index
        consumers = Consumer.order("created_at DESC")
        render json: {status:'SUCCESS', message:'Loaded consumers',data:consumers}, status: :ok
      end

      def create
        consumer = Consumer.new(consumer_params)
        if consumer.save
          render json: {status:'SUCCESS', message:'Created consumer',data:consumer}, status: :ok
        else
          render json: {status:'FAILURE', message:'Failed to create consumer',
            data:consumer.errors}, status: :unprocessable_entry
        end
      end

      def show
        consumer = Consumer.find(params[:id])
        render json: {status:'SUCCESS', message:'Found consumer',data:consumer}, status: :ok
      end

      def update
        consumer = Consumer.find(params[:id])
        if (consumer.update_attributes(consumer_params))
          render json: {status:'SUCCESS', message:'updated consumer',data:consumer}, status: :ok
        else
          render json: {status:'SUCCESS', message:'Failed to update consumer',
            data:consumer}, status: :unprocessable_entry
        end
      end

      def destroy
        consumer = Consumer.find(params[:id])
        consumer.destroy
        render json: {status:'SUCCESS', message:'Destroyed consumer',data:consumer}, status: :ok
      end

      private
      def consumer_params
        params.permit(:name,:email,:phone_number,:password,:flat_number,:building_name,:landmark,:area,:city,:state)
      end

    end
  end
end