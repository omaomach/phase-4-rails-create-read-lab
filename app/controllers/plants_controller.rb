class PlantsController < ApplicationController

    wrap_parameters format:[]

    def index 
        plants = Plant.all
        render json: plants, status: 200
    end

    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant, status: 200
        else
            render json: { error: "Plant Not Found" }, status: 404
        end
    end

    def create 
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    private
    def plant_params
        params.permit(:name, :image, :price)
    end

end
