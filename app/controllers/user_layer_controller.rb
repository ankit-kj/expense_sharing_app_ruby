
class UserLayerController < ApplicationController
  skip_before_action :verify_authenticity_token

  def home
    render json: "Welcome to the home page of expense sharing application"
  end


  def addUser
    params.require([:name,:email,:mobile,:groupName])
    groupAlreadyPresent = GroupServices::DoesGroupExist.new(params[:groupName]).call

    if(groupAlreadyPresent == false)
      render json: "No such group Exist"
      return
    end

    alreadyPresentUser = UserServices::DoesUserExist.new(params[:name]).call
    if(alreadyPresentUser == true)
      render json: "User with same name is already present"
      return
    end

    userId = UserServices::AddUser.new(params.permit(:name,:email,:mobile,:groupName)).call
    groupId = GroupServices::GetGroupId.new(params[:groupName]).call

    pairDraft ={
      "userId" => userId,
      "groupId" => groupId,
      "userName" => params[:name],
      "groupName" => params[:groupName]
    }

    # GroupUserPairServices::AddPair.new(hash).call
    groupUserPair = GroupUserPairServices::AddPair.new(pairDraft).call

    render json: "User added successfully"

  end
end
