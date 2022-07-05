class GroupLayerController < ApplicationController
  skip_before_action :verify_authenticity_token
  def addNewGroup
    params.require(:groupName)
    puts "groupName is #{params[:groupName]}"
    groupAlreadyPresent = GroupServices::DoesGroupExist.new(params[:groupName]).call

    if(groupAlreadyPresent)
      render json: "Group with same name is already present"
    else
      GroupServices::AddGroup.new(params[:groupName]).call
      render json: "Group Successfully added"
    end

  end
end
