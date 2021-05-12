# frozen_string_literal: true

class Homework
  def initialize(title:, description:, student:, mentor:)
    @title = title
    @description = description
    @student = student
    @mentor = mentor
    send_notification_to_student
  end

  def add_answer(answer)
    @answers ||= []
    @answers << answer
  end

  private

  def send_notification_to_student
    notification = Notification.new(receiver: @student, message: 'New homework!')
    @student.notifications += notification
  end
end
