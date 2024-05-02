require 'spec_helper'
require "#{__dir__}/../page_objects/login_page"
require "#{__dir__}/../page_objects/invoice_page"

describe "TC003: Validate invoice details", type: :feature do
  before :context do
    @login_page = LoginPage.new
    @invoice_page = InvoicePage.new
  end

  # I personally think it becomes easier to see what information you are validating but we could do it directly below.
  invoice_details = {
    'HotelName' => 'Rendezvous Hotel',
    'InvoiceDate' => '14/01/2018',
    'DueDate' => '15/01/2018',
    'InvoiceNumber' => 'Invoice #110 details',
    'BookingCode' => '0875',
    'CustomerDetails' => ['JOHNY SMITH', 'R2, AVENUE DU MAROC', '123456'],
    'Room' => 'Superior Double',
    'CheckIn' => '14/01/2018', 
    'CheckOut' => '15/01/2018',
    'TotalStayCount' => '1',
    'TotalStayAmount' => '$150',
    'DepositNow' => 'USD $20.90',
    'TaxAndVat' => 'USD $19'
  }

  it "TC003: Validate Invoice Details" do
    @login_page.login('demouser', 'abc123')
    
    invoice_window = window_opened_by do
      @invoice_page.invoice_details_link.click
    end
    
    within_window invoice_window do
      expect(page).to have_css('h4', text: invoice_details['HotelName'])
      expect(@invoice_page.invoice_date).to have_text(invoice_details['InvoiceDate'])
      expect(@invoice_page.invoice_due_date).to have_text(invoice_details['DueDate'])
      expect(page).to have_css('h6', text: invoice_details['InvoiceNumber'])
      expect(@invoice_page.invoice_booking_code).to have_text(invoice_details['BookingCode'])
      expect(page).to have_text(invoice_details['CustomerDetails'][0])
      expect(page).to have_text(invoice_details['CustomerDetails'][1])
      expect(page).to have_text(invoice_details['CustomerDetails'][2])
      expect(@invoice_page.invoice_room).to have_text(invoice_details['Room'])
      expect(@invoice_page.invoice_check_in).to have_text(invoice_details['CheckIn'])
      expect(@invoice_page.invoice_check_out).to have_text(invoice_details['CheckOut'])
      expect(@invoice_page.invoice_total_stay_count).to have_text(invoice_details['TotalStayCount'])
      expect(@invoice_page.invoice_total_stay_amount).to have_text(invoice_details['TotalStayAmount'])
      expect(@invoice_page.invoice_deposit_now).to have_text(invoice_details['DepositNow'])
      expect(@invoice_page.invoice_tax_and_vat).to have_text(invoice_details['TaxAndVat'])
      expect(@invoice_page.invoice_total_amount).to have_text(invoice_details['TotalAmount'])
    end
    
  end

end