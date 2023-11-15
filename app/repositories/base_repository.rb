# frozen_string_literal: true

class BaseRepository
  include Singleton
  
  delegate :find_by, to: :@db_client
  
  def initialize
    @db_client = class_object
  end

  def create!(object)
    raise ArgumentError unless object.is_a?(@db_client)
    raise ActiveRecord::RecordInvalid, object unless object.valid?

    save_object(object)
  end

  def create_from_params!(**params)
    @db_client.create!(**params)
  end

  def update!(object)
    raise ArgumentError if !object.is_a?(@db_client) || object.id.blank?
    raise ActiveRecord::RecordInvalid, object unless object.valid?

    save_object(object)
  end

  def multiple_update!(ids, **params)
    @db_client.where(id: ids).update_all(params)
  end

  protected

  def class_object
    model_name = self.class.to_s.gsub('Repository', '')
    Object.const_get model_name
  end

  private

  def save_object(object)
    object.save
    object
  end
end