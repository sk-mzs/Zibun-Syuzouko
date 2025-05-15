class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  # ログアウト後の遷移先
  def after_sign_out_path_for(resource_or_scope)
    pages_show_path
  end
end
