require 'csv'

class ContactManager
  def initialize(contacts_csv)
    @contacts_by_email = parse_contacts(contacts_csv)
  end

  def contacts_by_email
    @contacts_by_email ||= {}
  end

  protected
  def parse_contacts(contacts_csv)
    keys = %w{ first_name last_name email phone }
    contacts = CSV.parse(contacts_csv).map {|a| Hash[ keys.zip(a) ] }

    for contact in contacts
      contacts_by_email[contact['email'].downcase] = contact
    end

    contacts_by_email
  end
end
