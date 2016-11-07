module UsefulLogs
  class RequestInfo
    def self.field_ids
      %I(user_agent http_caching_enabled used_language accept_language)
    end

    def initialize(request, controller)
      @request    = request
      @controller = controller
    end

    def user_agent
      headers['HTTP_USER_AGENT']
    end

    def http_caching_enabled
      headers['HTTP_IF_NONE_MATCH'].present?
    end

    def accept_language
      headers['HTTP_ACCEPT_LANGUAGE']
    end

    def used_language
      I18n.locale
    end

    def to_h
      self.class.field_ids.each_with_object({}) do |field_id, hash|
        hash[field_id] = send(field_id)
      end
    end

    protected

    attr_reader :request, :controller

    delegate :headers, to: :request
  end
end
