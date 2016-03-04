require 'csv'

class ContactManager
  def initialize(contacts_csv)
    @contacts_indexes = parse_contacts(contacts_csv)
  end

  def contacts_indexes
    @contacts_indexes ||= { by_email: {}, by_last_initial: {} }
  end

  def find_by_email(email)
    @contacts_indexes[:by_email][email.downcase]
  end

  def find_by_last_initial(last_initial)
    @contacts_indexes[:by_last_initial][last_initial.downcase]
  end

  def self.formatted_contact(contact)
    "Last: #{contact['last_name']}, First: #{contact['first_name']}, Phone: #{contact['phone']}, E-Mail: #{contact['email']}"
  end

  protected
  def parse_contacts(contacts_csv)
    keys = %w{ first_name last_name email phone }
    contacts = CSV.parse(contacts_csv).map {|a| Hash[ keys.zip(a) ] }

    for contact in contacts
      contacts_indexes[:by_email][contact['email'].downcase] = contact
      contacts_indexes[:by_email][contact['email'].downcase] = contact
      last_initial_downcased = contact['last_name'][0].downcase

      if existing_contacts = contacts_indexes[:by_last_initial][last_initial_downcased]
        contacts_indexes[:by_last_initial][last_initial_downcased] = (contacts_indexes[:by_last_initial][last_initial_downcased] + [contact]).sort! { |x,y| x['last_name'].downcase <=> y['last_name'].downcase }
      else
        contacts_indexes[:by_last_initial][last_initial_downcased] = [contact]
      end
    end

    contacts_indexes
  end
end
