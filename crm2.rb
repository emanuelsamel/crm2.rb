require_relative 'contact.rb'

class crm2

  def initialize(name)
    @name = name
    puts "This CRM has the name " + @name
  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    notes = gets.chomp

    Contact.create(first_name, last_name, email, notes = "N/A")
  end


  def modify_existing_contact

    print "What's the first name of the contact you would like to modify?"
    value_find = gets.chomp

    contact_to_modify = Contact.find_by("first_name", value_find)

    print 'Enter the attribute you would like to modify: '
    attribute = gets.chomp

    print 'Enter the new value for that attribute: '
    value = gets.chomp

    contact_to_modify.update(attribute, value)
  end

  def delete_contact
    print "What's the first name of the contact you would like to delete?"
    value_delete = gets.chomp
    contact_to_delete = Contact.find_by("first_name", value_delete)

    print 'Deleting contact...'
    contact_to_delete.delete
  end

  def display_all_contacts
    print 'Displaying all contacts...'
    Contact.all.each do |contact|
      puts "#{contact.first_name} #{contact.last_name} #{contact.email} #{contact.notes}"
    end
  end

  def search_by_attribute
    print 'Enter the attribute you would like to search for: '
    attritube = gets.chomp

    print 'Enter the value for that attribute: '
    value = gets.chomp

    Contact.find_by(attribute, value)
  end

end
