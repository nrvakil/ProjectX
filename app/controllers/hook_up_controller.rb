class HookUpController < ActionController::Base

  def hookup
    hookup_service = HookingService.new(params)
    result = hookup_service.hook_up
    render :json => { :message => result }, :status => 200
  end

  def respond
    hookup_service = HookingService.new(params)
    result = hookup_service.respond
    render :json => { :message => result }, :status => 200
  end

end