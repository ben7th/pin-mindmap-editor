class BundlesController < ApplicationController
  before_filter :check_token
  skip_before_filter :verify_authenticity_token

  def create
    bp = BundleParser.new(params[:bundle])
    if bp.has_bundle_text?
      mindmap = Mindmap.new(:title=>"discussion_#{randstr}")
      mindmap.user_id = @user.id
      mindmap.struct = bp.parse
      if mindmap.save
        return render :status=>200,:text=>"200"
      end
    end
    render :status=>500,:text=>"500"
  end

  def check_token
#    params[:req_user_id]
#    params[:token]
    @user = User.find(params[:req_user_id])
    return true
  end
end
