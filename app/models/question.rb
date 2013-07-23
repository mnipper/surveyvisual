class Question
  include Mongoid::Document
  field :screen_id, type: Integer 
  field :screen_text, type: String 

  def answers(options={})
    if options.has_key? :participant_id
      Answer.where(screen_id: self.screen_id,
        participant_id: options[:participant_id]).entries
    else
      Answer.where(screen_id: self.screen_id).entries
    end
  end

  def numeric_answers?
    answers.first.numeric?
  end

  def stats
    StatFactory.stats(self)
  end
end
