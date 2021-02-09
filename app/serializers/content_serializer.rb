class ContentSerializer < ActiveModel::Serializer
  attributes :project_id, :projectOwnerName, :title, :body, :created_at, :updated_at

  def projectOwnerName
    @project = Project.find(object.project_id)
    @user = User.find(@project.user_id)
    @completeName = @user.firstName + " " + @user.lastName
    @completeName
  end
end
