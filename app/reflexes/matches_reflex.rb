# frozen_string_literal: true
class MatchesReflex < ApplicationReflex
  def accept(match_id, other_match_id)
    match = Match.find_by(id: other_match_id)
    match.accept(true)
  end
end