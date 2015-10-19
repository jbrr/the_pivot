module Admin::CandidatesHelper

  def goals
    @current_candidate.candidate_issues.map do |candidate_issue|
      candidate_issue.goal
    end
  end

  def total_goal
    goals.reduce(:+)
  end

  def campaign_raised_total
    @current_candidate.candidate_issues.inject(0) {|sum, x| sum + candidate_issue_raised_total(x)}
  end

  def campaign_percent_calculation
    campaign_raised_total.to_f / total_goal.to_f * 100
  end

  def campaign_progress_bar_percentage
    if campaign_percent_calculation.nan?
      0
    elsif campaign_percent_calculation > 100
      100
    else
      campaign_percent_calculation
    end
  end
end
