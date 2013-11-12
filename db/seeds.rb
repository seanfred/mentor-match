# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin_user = User.create( email: "admin@mentormatch.com",
                          password: "password",
                          approval: 1,
                          role: "admin")
admin_user.admin = true
admin_user.approval = 1
admin_user.save!


user_student = User.create( email: "student@mentormatch.com",
                            password: "password",
                            role: "student",
                            approval: 1)

student_user = Student.new(personal_first_name: "Harper",
                              personal_last_name: "Christopherson",
                              user_id: user_student.id)

student_user.save!

user_mentor = User.create(  email: "mentor@mentormatch.com",
                            password: "password",
                            role: "mentor",
                            approval: 1)

mentor_user = Mentor.new(personal_first_name: "Risk",
                              personal_last_name: "Whistler",
                              user_id: user_mentor.id,
                              career_job_title: "CEO",
                              career_company_type: "startup",
                              career_company_private: "Amazon")

mentor_user.save!
