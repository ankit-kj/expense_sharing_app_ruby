class TransactionLayerController < ApplicationController
  skip_before_action :verify_authenticity_token
  def addTransaction
    params.require([:amount,:groupName,:memberName])

    groupAlreadyPresent = GroupServices::DoesGroupExist.new(params[:groupName]).call
    if(groupAlreadyPresent == false)
      render json: "No such group Exists"
      return
    end

    records = GroupUserPairServices::GetTotalRecordsByGroupName.new(params[:groupName]).call
    totalMembers = records.size

    amountPerHead = params[:amount] / totalMembers
    payingMember = params[:memberName]

    records.each do |w|
      if w.userName != payingMember

        recordAlreadyPresent = AuditServices::DoesPairExist.new(w.userName,payingMember).call
        if (recordAlreadyPresent == true)
          AuditServices::UpdateTransaction.new(w.userName,payingMember,amountPerHead).call
        else
          AuditServices::AddNewTransaction.new(w.userName,payingMember,amountPerHead).call
        end

      end
    end

    render json: "Transaction completed successfully"
  end
end
