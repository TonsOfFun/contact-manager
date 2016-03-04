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

  describe ".formatted_contact" do
    subject { ContactManager.formatted_contact(contact) }

    it "returns a formatted string representation of the contact" do
      expect(subject).to eq(formatted_contact)
    end
  end

  # * Should be a method that allows to find a single contact by email in O(1) time (Hash Lookup is Linear so we'll use that).
  describe "#find_by_email" do
    subject { ContactManager.new(contacts_csv).find_by_email(contact['email']) }

    it "returns contact matching the given email" do
      expect(subject).to eq(contact)
    end
  end
end
