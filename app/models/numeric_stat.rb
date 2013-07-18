class NumericStat

  def self.stats(question)
    raise 'Not numeric answers' unless question.numeric_answers?

    stats = Hash.new
    @question = question
    [:average, :sample_variance].each do |stat|
      stats[stat] = self.send(stat)
    end
    stats
  end

  ## SHOULD REPLACE THESE WITH R CODE ##

  def self.average
    sum = 0.0
    @question.answers.each { |answer| sum += answer.result_answer.to_f }
    sum /= @question.answers.length
   end

   def self.sample_variance
    variance = 0.0
    @question.answers.each do |answer| 
      variance += (answer.result_answer.to_f - self.average) ** 2
    end
    variance /= (@question.answers.length - 1)
   end
end
