class Video < ApplicationRecord
  belongs_to :user



  # Paperclip attachments 
  has_attached_file :video_file
  has_attached_file :mp4_file
  has_attached_file :webm_file
  has_attached_file :ogg_file
  # imagemagick resing
  has_attached_file :thumbnail, styles: { medium_nr: "250x150!" }

  # Paperclip attachment validators
  validates_attachment_content_type :video_file, content_type: /\Avideo/
  validates_attachment_content_type :mp4_file, content_type: /.*/
  validates_attachment_content_type :webm_file, content_type: /.*/
  validates_attachment_content_type :ogg_file, content_type: /.*/

  # :video_file validation
  validates_attachment_presence :video_file

  # Publish video 
  def publish!
    self.published = true
    save
  end

  # Increment likes counter
  def like!
    self.likes += 1
    save
  end

  # Decrease likes counter
  def dislike!
    self.likes -= 1
    save
  end

  # Checks all formats are already encoded
  def all_formats_encoded?
    self.webm_file.path && self.mp4_file.path && self.ogg_file.path ? true : false
  end
end
