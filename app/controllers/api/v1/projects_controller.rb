class Api::V1::ProjectsController < ApplicationController
    # GET /projects
    def index
        @projects = Project.all
        render json: @projects
    end

    # GET /projects/:id
    def show
        parameter_id = params[:id]
        if parameter_id == 'my_projects'
            @projects = Project.where(user_id: current_user.id)
            render json: @projects, each_serializer: OwnProjectSerializer
        else
            @project = Project.find(parameter_id)
            render json: @project
        end
    end

    # POST /projects
    def create
        params[:thumbnail] = "http://ondronemap.com/" + params[:thumbnail].original_filename

        @project = Project.new
        @project.title = project_params[:title]

        projType = project_params[:type]
        case projType
            when 'in_house'
                projType = 0
            when 'external'
                projType = 1
            when 'international'
                projType = 2
        end
        @project.projectType = projType

        @project.location = project_params[:location]
        @project.thumbnail = project_params[:thumbnail]
        @project.description = project_params[:description]
        @project.user_id = current_user.id

        if @project.user_id == current_user.id
            if @project.save
                render json: @project, status: 201
            else
                render error: { error: 'Unable to create Project'}, status: 400
            end
        else
            raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
        end
    end

    # PUT /projects/:id
    def update
        @project = Project.find(params[:id])

        if @project.user_id == current_user.id
            project = @project
            project.title = params[:title]

            projType = params[:type]
            case projType
                when 'in_house'
                    projType = 0
                when 'external'
                    projType = 1
                when 'international'
                    projType = 2
            end
            project.projectType = projType

            project.location = params[:location]
            project.thumbnail = params[:thumbnail]
            project.description = params[:description]

            selfParam = {
                title: project.title,
                thumbnail: project.thumbnail,
                description: project.description,
                location: project.location,
                projectType: project.projectType
            }

            if @project.update(selfParam)
                render json: @project
            else
                render error: { error: 'Unable to update Project'}, status: 400
            end
        else
            raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
        end
    end

    # DELETE /projects/:id
    def destroy
        @project = Project.find(params[:id])
        @contents = Content.where(project_id: params[:id])
        if @project.user_id == current_user.id
            @contents.destroy_all
            @project.destroy
            response = { message: Message.deleted }
            render json: response
        else
            raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
        end
    end

    private

    def project_params
        params.permit(
            :title,
            :type,
            :location,
            :thumbnail,
            :description
        )
    end
end
