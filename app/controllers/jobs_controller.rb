class JobsController < ApplicationController
before_action :find_job, only: [:show, :update, :destroy]

def index 
        @jobs = Job.all 
        render json: @jobs 
    end

    def show 
        render json: @job
    end

    def create 
        @job = Job.new(job_params)
        if @job.save 
            render json: @job 
        else 
        render json: {errors: @job.errors.messages}
        end
        
    end

    def update 
        @job.update(job_params)

        render json: @job
    end

    def destroy 
        @job.destroy 
        render json: {message: " #{@job.title} was deleted"}
    end

    private 

    def find_job 
        @job = Job.find(params[:id])
    end

    def job_params 
        params.require(:job).permit(:title, :company, :company_url, :logo_url, :location)
    end

end
