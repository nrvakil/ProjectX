class HookingService

  def initialize (params = {})
    @params = params
  end

  def tap
    @hookup = HookUp.new(create_hookup_hash)
    set_users
    @hookup.save ? notify : @hookup.errors.messages
  end

  def respond
    @hookup = HookUp.where(:id => hookup_id).first
    @hookup.responded_at = Time.now
    @hookup.hooked = true
    share_details if @hookup.save
  end

  attr_reader :params, :hookup, :hooker, :hookie
  private

  def hookup_id
    params[:hookup_id]
  end

  def user_id
    params[:user_id]
  end

  def hookup_with
    params[:hookup_with]
  end

  def create_hookup_hash
    {
      :hooker       => user_id,
      :hookie       => hookup_with,
      :pinged_at    => Time.now,
      :responded_at => "",
      :hooked       => false
    }
  end

  def set_users
    @hooker = UserService.new({ :user_id => hookup.hooker }).get_user
    @hookie = UserService.new({ :user_id => hookup.hookie }).get_user
  end

  def share_details
    hooker.send({ :message => "#{hookie.number}" })
    hookie.send({ :message => "#{hooker.number}" })
  end

  def notify
    hooker.send({ :message => "hookup request sent!" })
    hookie.send({ :message => "new hookup request!" })
  end

end