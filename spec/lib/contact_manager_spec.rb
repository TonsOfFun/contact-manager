require './lib/contact_manager'

RSpec.describe ContactManager do
  let(:contact) { { 'first_name' => 'William', 'last_name' => 'Shryock', 'email' => 'WilliamLShryock@rhyta.com', 'phone' => '7704585414' } }
  let(:formatted_contact) { "Last: #{contact['last_name']}, First: #{contact['first_name']}, Phone: #{contact['phone']}, E-Mail: #{contact['email']}" }
  let(:last_initial_downcased) { contact['last_name'][0].downcase }
  let(:email_downcased) { contact['email'].downcase }

  let(:contacts_csv) do
    %{Amy,Ghent,AmyJGhent@dayrep.com,7324301260\nWilliam,Shryock,WilliamLShryock@rhyta.com,7704585414\nTeresa,McCrea,TeresaCMcCrea@teleworm.us,8472769668\nLisa,Sauceda,LisaESauceda@armyspy.com,3076999741}
  end

  describe ".new" do
    subject { ContactManager.new(contacts_csv).contacts_by_email }

    it "returns hash contacts_by_email the with email downcased as keys and contact as values" do
      expect(subject[email_downcased]).to eq(contact)
    end
  end
end
