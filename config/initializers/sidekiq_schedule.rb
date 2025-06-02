require 'sidekiq/cron/job'

Sidekiq::Cron::Job.create(
  name: 'Send Weekly Summary - every Sunday at 7am',
  cron: '0 7 * * 0', # At 07:00 on Sunday
  class: 'WeeklySummaryJob'
)
