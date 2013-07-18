class StatFactory
  def self.stats(question)
    if question.numeric_answers?
      NumericStat.stats(question)
    end
  end
end
