class ProjectSerializer < ActiveModel::Serializer
  attributes :title, :thumbnail, :description, :location, :type, :ownerName, :created_at, :updated_at

  def type
    @projType = object.projectType
    if @projType == 0
      @nilai = "in_house"
      @nilai
    elsif @projType ==  1
      @nilai = "external"
      @nilai
    elsif @projType == 2
      @nilai = "international"
      @nilai
    end
  end

  def ownerName
    @user = User.find(object.user_id)
    @completeName = @user.firstName + " " + @user.lastName
    @completeName
  end
end
