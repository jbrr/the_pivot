module Admin::CandidatesHelper

  def goals
    @current_candidate.candidate_issues.map do |candidate_issue|
      candidate_issue.goal
    end
  end

  def total_goal
    goals.reduce(:+)
  end

end
