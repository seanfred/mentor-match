class Mentor < ActiveRecord::Base
  attr_accessible :user_id,

                  :career_company_private, :career_information,
  								:career_job_title, :career_company_type,

  								:cf_class,

  								:experience_degree, :experience_other_degree,
  								:experience_university,

  								:mentee_gender, :mentee_extra_info,
  								:mentee_skills_c, :mentee_skills_coffeescript,
  								:mentee_skills_cplusplus, :mentee_skills_developer,
  								:mentee_skills_html_css, :mentee_skills_java,
  								:mentee_skills_javascript, :mentee_skills_net, :mentee_skills_object,
  								:mentee_skills_other_coding, :mentee_skills_php,
  								:mentee_skills_python, :mentee_skills_ruby,

  								:personal_first_name, :personal_knowledge_impart,
  								:personal_last_name, :personal_why_mentor,

  								:skills_career_advice,
  								:skills_coding_question_tactics, :skills_development,
  								:skills_extra_info,
  								:skills_github_account_development,
  								:skills_interview_coaching, :skills_job_search,
  								:skills_resume_development, :skills_selling_idea,
  								:skills_soft_skills

  has_many :students, through: :mentorships
  belongs_to :user, dependent: :delete
  has_many :reviews
  has_many :mentorships

  searchable do
    text :career_information
  end


end
