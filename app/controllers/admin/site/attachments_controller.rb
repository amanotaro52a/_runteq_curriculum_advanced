class Admin::Site::AttachmentsController < ApplicationController
  before_action :set_site

  def destroy
    authorize(current_site) # current_siteはSite.firstで対応できるが、今後の拡張を考慮して権限管理する
    image = ActiveStorage::Attachment.find_by!(id: params[:id]) 
    image.purge
    redirect_to edit_admin_site_path
  end
end

private

def set_site
  @site = Site.find(current_site.id)
end