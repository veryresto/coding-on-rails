class Api::V1::ContentsController < ApplicationController
    before_action :set_project, except: [:update, :destroy]
    before_action :set_project_content, only: [:show]
    before_action :set_content, only: [:update, :destroy]

    # GET /projects/:project_id/contents
    def index
        @contents = Content.where(project_id: @project.id )
        # render json: @project.contents
        render json: @contents
    end

    # GET /projects/:project_id/contents/:id
    def show
        render json: @content
    end

    # POST /projects/:project_id/contents
    def create
        if @project.user_id == current_user.id
            @content = @project.contents.create!(content_params)
            if @content
                # json_response(@project, :created)
                render json: @content, status: 201
            else
                render error: { error: 'Unable to create Content'}, status: 400
            end
        else
            raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
        end
        
    end

    # PUT /contents/:id
    def update
        if @project.user_id == current_user.id
            if @content.update(content_params)
                render json: @content
            else
                render error: { error: 'Unable to update Content'}, status: 400
            end
        else
            raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
        end
    end

    # DELETE /contents/:id
    def destroy
        if @project.user_id == current_user.id
            @content.destroy
            response = { message: Message.deleted }
            render json: response
        else
            raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
        end
    end

    private

    def content_params
        params.permit(:title, :body)
    end

    def set_project
        @project = Project.find(params[:project_id])
    end

    def set_project_content
        @content = @project.contents.find_by!(id: params[:id]) if @project
    end

    def set_content
        @content = Content.find(params[:id])
        @project = Project.find(@content.project_id)
    end
end
