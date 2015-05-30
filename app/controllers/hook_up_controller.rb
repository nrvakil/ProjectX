class HookUpController < ActionController::Base

  def tap
    hookup_service = HookingService.new(params)
    hookup_service.tap
    render :nothing, :status => 200
  end

  def respond
    hookup_service = HookingService.new(params)
    hookup_service.respond
    render :nothing, :status => 200
  end

end