module EmailAlertService
  def self.services(name, service = nil)
    @services ||= {}

    if service
      @services[name] = service
      true
    elsif @services[name]
      @services[name]
    else
      raise ServiceNotRegisteredException, name
    end
  end

  class ServiceNotRegisteredException < StandardError; end
end

EmailAlertService.services(
  :redis,
  Redis::Namespace.new("email-alert-service", redis: Redis.new),
)
