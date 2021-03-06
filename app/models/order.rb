class Order < ActiveRecord::Base
 
  # Attributes accessible on create! or update! 
  attr_accessible :value, :token
  
  
  # We are creating Universally Unique Ids for each order
  before_validation :generate_uuid!, on: :create


  # Relationship with Projects and the correspondent user for each order
  belongs_to :project
  belongs_to :user

  # This attributes should be present when creating an order
  validates_presence_of :value, :project, :user

  # Scope for completed payments
  scope :raised, where('token IS NOT NULL')

  # We don't people to reassign uuids
  attr_readonly :uuid
  

  def generate_payment_token!
    # Set up the payer for MoIP payment
    payer = MyMoip::Payer.new(self.as_json)

    # Create the payment instruction for the payer
    instruction = MyMoip::Instruction.new({
      id: SecureRandom.hex(8),
      payment_reason: "[Crowdfunding] #{self.email} - #{self.created_at}",
      values: [self.value.to_f],
      payer: payer
    })
      
    # Initialize a new transparent request
    transparent = MyMoip::TransparentRequest.new('crowdfunding')

    # Make the call to the MoIP API
    transparent.api_call(instruction)
    

    self.token = transparent.token
    self.save!
  end


  private
    # Generating unique UUID using the 1.9.3 Standard lib
    def generate_uuid!
      self.uuid = SecureRandom.uuid 
    end

end
