class GradeDecorator < Draper::Decorator
  delegate_all

  def formatted_date
    object.date.strftime('%d.%m.%Y')
  end
end
