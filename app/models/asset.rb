class Asset < ActiveRecord::Base
  attr_accessible :asset_content_type, :asset_file_name, :asset_file_size, :asset_updated_at, :task_id, :assets_attributes, :asset

  belongs_to :task

  has_attached_file :asset, 
  					:styles => { :large => '800x600', :medium => '300x300', :small => '100x100', :thumb => '60x60' }
end
