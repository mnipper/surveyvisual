class StatFactory
  def self.stats(question)
    if question.numeric_answers?
      NumericStat.stats(question)
    else
      Hash.new
    end
  end
end
