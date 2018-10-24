class ScenariosController < ApplicationController
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
                file_path: output_path)
            scenario.save!
        end
        rescue => e
    end

    private
	def fileupload_param
      params.require(:fileupload).permit(:file)
	end
end
