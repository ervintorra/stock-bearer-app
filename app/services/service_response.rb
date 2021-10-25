class ServiceResponse
  attr_reader :resource, :message

  def initialize(success:, resource:, message:)
    @success = success
    @resource = resource
    @message = message
  end

  def success?
    @success
  end

  def json_response
    success? ? ok_response : error_response
  end

  private

  def ok_response
    resp = { success: true }
    resp[:data] = resource if resource
    resp
  end

  def error_response
    resp = { success: false }
    resp[:error] = message if message
    resp
  end
end