class StatFactory
  def self.stats(question)
    if question.numeric_answers?
      NumericStat.stats(question)
    else
      # Placeholder for categorical stats
      Hash.new
    end
  end
end
