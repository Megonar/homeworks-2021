# frozen_string_literal: true

class Mentor
  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @students = []
    @notifications = []
  end
  attr_reader :students
  attr_accessor :notifications

  def add_homework(title:, description:, student:)
    homework = Homework.new(title: title, description: description, student: student, mentor: self)
    student.homeworks += homework
  end

  def subscribe_to!(student)
    @students << student
  end

  def mark_as_read!
    notifications.each(&:mark_as_read!)
  end

  def reject_to_work!(homework)
    notification = Notification.new(receiver: homework.student, message: 'Homework rejected to work!',
                                    subject: homework)
    homework.student.notifications += notification
  end

  def accept!(homework)
    notification = Notification.new(receiver: homework.student, message: 'Homework accepted!')
    homework.student.notifications += notification
  end

  def homeworks_to_check
    notifications_about_homeworks_to_check = notifications.select { |notification| notification.type == :to_check }
    notifications_about_homeworks_to_check.map(&:subject)
  end
end
