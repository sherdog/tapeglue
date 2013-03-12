class DeviseFailure < Devise::FailureApp
  

  def redirect_url
    if warden_message == :unconfirmed
       resend_confirmation_path
    else
      super
    end
  end

end