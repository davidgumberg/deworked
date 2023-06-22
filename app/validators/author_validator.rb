class AuthorValidator < ActiveModel::Validator
  def validate(record)
    unless record.birth.blank? || record.death.blank?
      birth_is_before_death?(record)
    end
  end

  def birth_is_before_death?(record)
    unless record.birth < record.death
      record.errors.add :birth, 'Surely, birth must come before death!'
    end
  end
end
