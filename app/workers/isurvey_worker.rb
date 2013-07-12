class IsurveyWorker
  include Sidekiq::Worker
  sidekiq_options retry: true

  def perform
    $redis = Redis.new(host: 'localhost', port: 6379)
    Isurvey::API.load
    Isurvey::Result.all.each do |result|
      $redis.sadd(result.result_id, result)
    end
  end
end
