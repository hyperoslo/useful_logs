module UsefulLogs
  module RegisterRequestInfo
    def current_request_info
      klass = UsefulLogs.config.request_info_class_name.constantize
      @current_request_info ||= klass.new(request, self)
    end

    def append_info_to_payload(payload)
      super
      payload.merge!(current_request_info.to_h)
    end
  end
end
