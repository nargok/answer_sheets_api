module ResponseGenerator
  extend ActiveSupport::Concern

  def index_data(entities, data)
    render json: { status: 'success', message: "Loaded #{entities}", data: data}
  end

  def show_data(entity, data)
    render json: { status: 'success', message: "Loaded the #{entity}", data: data }
  end

  def create_success(entity, data)
    render json: { status: 'success', message: "Created the #{entity}", data: data }
  end

  def create_error(error_messages)
    render json: { status: 'ERROR', message: 'Not created', errors: error_messages }
  end

  def update_success(entity, data)
    render json: { status: 'success', message: "Updated the #{entity}", data: data }
  end

  def update_error(error_messages)
    render json: { status: 'ERROR', message: 'Not updated', errors: error_messages }
  end

  def destroy_data(entity, data)
    render json: { status: 'SECCESS', message: "Deleted the #{entity}", data: data }
  end
end
