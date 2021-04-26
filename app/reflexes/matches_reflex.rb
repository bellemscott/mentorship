# frozen_string_literal: true

class MatchesReflex < ApplicationReflex
  def accept
    match = Match.find(element.dataset[:id])
    match.accept(true)
    cable_ready["matching"].
  end 
end
