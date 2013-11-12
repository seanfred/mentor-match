class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.boolean :notify, default: false
      t.string :cf_class
      t.string :personal_first_name
      t.string :personal_last_name
      t.string :personal_where_you_from
      t.string :experience_university
      t.string :experience_degree
      t.string :experience_other_degree
      t.string :experience_job
      t.string :experience_why_codefellows
      t.string :experience_project
      t.integer :skills_developer
      t.integer :skills_object
      t.integer :skills_html_css
      t.integer :skills_javascript
      t.integer :skills_java
      t.integer :skills_cplusplus
      t.integer :skills_c
      t.integer :skills_ruby
      t.integer :skills_python
      t.integer :skills_php
      t.integer :skills_net
      t.integer :skills_coffeescript
      t.string :skills_other_coding
      t.integer :skills_selling_yourself
      t.integer :skills_development_familiarity
      t.integer :skills_agile_development_experience
      t.string :learning_self_taught
      t.string :learning
      t.string :learning_preference
      t.string :learning_extra_information
      t.integer :mentor_career_advice
      t.integer :mentor_skill_development
      t.integer :mentor_coding_question_tactics
      t.integer :mentor_soft_skills
      t.integer :mentor_interview_coaching
      t.integer :mentor_job_search
      t.integer :mentor_resume_development
      t.integer :mentor_github_account_development
      t.integer  :mentor_selling_idea
      t.string :mentor_company_type
      t.string :mentor_gender
      t.string :mentor_extra_info
      t.string :goals_company_type
      t.string :goals_after_codefellows
      t.string :goals_dream_job_title
      t.string :goals_companies
      t.string :goals_next_year
      t.string :goal_next_4_years
      t.string :goals_stay_seattle
      t.string :linked_in
      t.string :goals_extra_info
      t.integer :mentor_id

      t.timestamps
    end
  end
end
