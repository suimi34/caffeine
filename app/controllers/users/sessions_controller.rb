# frozen_string_literal: true

class Users::SessionsController < Devise::Passwordless::SessionsController
  def create
    user = User.find_or_initialize_by(email: params[:user][:email])
    user.save! if user.new_record?

    user.send_magic_link
    flash[:notice] = "マジックリンクをメールで送信しました。メールをご確認ください。"
    redirect_to new_user_session_path
  end
end
