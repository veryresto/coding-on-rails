module Response
    def json_response(object, status = :ok)
      render json: object, status: status
    end

    def json_response_status(object, status = :ok)
      render status: status
    end
end