class ScenariosController < ApplicationController
    #before_action :authenticate_user!
    def create
        ActiveRecord::Base.transaction do 
            # 処理
            uploaded_file = fileupload_param[:file]
            output_path = Rails.root.join('public', uploaded_file.original_filename)

            File.open(output_path, 'w+b') do |fp|
                fp.write  uploaded_file.read
            end

            scenario = Scenario.new(
                title: params[:title],
                user_name: params[:user_name],
                test_up: uploaded_file,
                file_path: output_path,
                join_num: params[:join_num])
            scenario.save!
        end
        rescue => e
    end

    def show
        scenario_list = Scenario.find(params[:id])
        render json: scenario_list
    end

    def index
        scenario_list = Scenario.all
        render json: scenario_list
    end

    private
	def fileupload_param
      params.require(:fileupload).permit(:file)
	end
end
