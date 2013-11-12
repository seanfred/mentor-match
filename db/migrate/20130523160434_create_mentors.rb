class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.string :personal_first_name
      t.string :personal_last_name
      t.string :personal_why_mentor
      t.string :personal_knowledge_impart
      t.string :career_information
      t.string :career_job_title
      t.string :career_company_private
      t.string :career_company_type
      t.string :experience_university
      t.string :experience_degree
      t.string :experience_other_degree
      t.string :experience_job
      t.string :experience_project
      t.integer :mentee_skills_developer
      t.integer :mentee_skills_html_css
      t.integer :mentee_skills_javascript
      t.integer :mentee_skills_java
      t.integer :mentee_skills_cplusplus
      t.integer :mentee_skills_c
      t.integer :mentee_skills_ruby
      t.integer :mentee_skills_python
      t.integer :mentee_skills_php
      t.integer :mentee_skills_net
      t.integer :mentee_skills_coffeescript
      t.integer :mentee_skills_object
      t.string :mentee_skills_other_coding
      t.string :mentee_gender
      t.integer :skills_career_advice
      t.integer :skills_development
      t.integer :skills_coding_question_tactics
      t.integer :skills_soft_skills
      t.integer :skills_interview_coaching
      t.integer :skills_job_search
      t.integer :skills_resume_development
      t.integer :skills_github_account_development
      t.integer :skills_selling_idea
      t.string :mentee_extra_info
      t.string :cf_class

      t.timestamps
    end
  end
end
