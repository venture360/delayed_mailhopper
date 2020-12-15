require 'mailhopper'
require 'delayed_job'

module DelayedMailhopper
  class Email < Mailhopper::Email
    after_create :enqueue

    def enqueue
      job = ::DelayedMailhopper::SendJob.new(self.id)
      Delayed::Job.enqueue(job)
    end
  end
end