# Generate random public id
# Doesn't care about the uniqueness of the id
# Model must use `validates_uniqueness_of :public_id`
class UniqueIdService
  def self.generate
    self.random_id
  end

  private

  def self.random_id
    SecureRandom.hex 18
  end
end
