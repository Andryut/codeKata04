load "TableFile.rb"

class SoccerLeagueTable < TableFile
  def update
    super
    unless @data.nil?
      @teams = Array.new
      @data.each do |element|
        unless element[0].to_i == 0
          @teams << SoccerTeam.new(teamName: element[1], goalScoredFor: element[6].to_i, goalScoredAgainst: element[7].to_i)
        end
      end
    end
  end

  def to_s
    out = ""
    @teams.each do |team|
      out += team.to_s + "\n"
    end
    out
  end

  def minimumGoalsDifference
    unless @teams.nil?
      minGoalsDifference = Array.new
      minGoalsDifference << @teams[0]
      iteration = 0
      @teams.each do |team|
        if minGoalsDifference[0].goalsDifference > team.goalsDifference
          minGoalsDifference.clear
          minGoalsDifference << team
        elsif minGoalsDifference[0].goalsDifference == team.goalsDifference
          minGoalsDifference << team
        end
        if iteration == 0
          minGoalsDifference.pop
          iteration += 1
        end
      end
      minGoalsDifference
    end
  end
end

class SoccerTeam
  def initialize teamName:, goalScoredFor:, goalScoredAgainst:
    @teamName = teamName
    @goalScoredFor = goalScoredFor
    @goalScoredAgainst = goalScoredAgainst
  end

  def goalsDifference
    (@goalScoredFor - @goalScoredAgainst).abs
  end

  def to_s
    '[' + @teamName + ', ' + @goalScoredFor.to_s + ', ' + @goalScoredAgainst.to_s + ']'
  end
end
