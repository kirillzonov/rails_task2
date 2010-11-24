module HomeHelper
  def can_vote?
    if request.env['REMODE_ADDR']
    end
  end
end
