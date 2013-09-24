class NumericStat

  def self.stats(question)
    raise 'Not numeric answers' unless question.numeric_answers?

    stats = Hash.new
    @question = question
    [:sample_mean, :sample_variance].each do |stat|
      stats[stat] = self.send(stat).round(3)
    end
    stats
  end

  def self.sample_mean
    sum = 0.0
    @question.answers.each { |answer| sum += answer.result_answer.to_f }
    sum /= @question.answers.length
   end

   def self.sample_variance
    variance = 0.0
    @question.answers.each do |answer| 
      variance += (answer.result_answer.to_f - self.sample_mean) ** 2
    end
    variance /= (@question.answers.length)
   end
end
