class Student < ActiveRecord::Base
  attr_accessible :user_id, :mentor_id, :notify,

                  :experience_degree, :experience_job, :experience_other_degree,
  								:experience_project, :experience_university, :experience_why_codefellows,
  								#goal
  								:goal_next_4_years, :goals_after_codefellows, :goals_companies,
  								:goals_company_type, :goals_dream_job_title, :goals_extra_info,
  								:goals_next_year, :goals_stay_seattle,
  								:learning, :learning_extra_information, :learning_preference, :learning_self_taught,
  								# mentor
  								:mentor_career_advice, :mentor_coding_question_tactics, :mentor_company_type,
  								:mentor_extra_info, :mentor_gender, :mentor_github_account_development,
  								:mentor_interview_coaching, :mentor_job_search, :mentor_resume_development,
  								:mentor_selling_idea, :mentor_skill_development, :mentor_soft_skills,
  								# personal
                  :personal_last_name, :personal_where_you_from,
                  :personal_first_name,
  								# skills
  								:skills_agile_development_experience, :skills_c, :skills_coffeescript,
  								:skills_cplusplus, :skills_developer, :skills_development_familiarity,
  								:skills_html_css, :skills_java, :skills_javascript, :skills_net,
  								:skills_other_coding, :skills_php, :skills_python, :skills_ruby,
  								:skills_selling_yourself, :skills_object,
  								#linked in
  								:linked_in, :cf_class


  validates :personal_first_name, presence: true
  validates :personal_last_name, presence: true

  belongs_to :mentor
  has_many :rankings, dependent: :delete_all
  has_many :studentrankings, dependent: :delete_all
  belongs_to :user, dependent: :delete
end
