class Notification < ActiveRecord::Base
  attr_accessible :message, :receiver, :receiver_id, :receiver_type, :subject

  belongs_to :receiver, :polymorphic => true
end
