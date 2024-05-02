class InvoicePage
  include Capybara::DSL
  
  def invoice_details_link
    find(:xpath, '(//a[contains(text(), "Invoice Details")])[1]')
  end

  def invoice_date
    find(:xpath, '//span[contains(text(), "Invoice Date:")]/..')
  end

  def invoice_due_date
    find(:xpath, '//span[contains(text(), "Due Date:")]/..')
  end

  def invoice_booking_code
    find(:xpath, '//td[contains(text(),"Booking Code")]/following-sibling::td')
  end

  def invoice_room
    find(:xpath, '//td[contains(text(),"Room")]/following-sibling::td')
  end

  def invoice_check_in
    find(:xpath, '//td[contains(text(),"Check-In")]/following-sibling::td')
  end

  def invoice_check_out
    find(:xpath, '//td[contains(text(),"Check-Out")]/following-sibling::td')
  end

  def invoice_total_stay_count
    find(:xpath, '//td[contains(text(),"Total Stay Count")]/following-sibling::td')
  end

  def invoice_total_stay_amount
    find(:xpath, '//td[contains(text(),"Total Stay Amount")]/following-sibling::td')
  end

  def invoice_deposit_now
    find(:xpath, '//td[contains(text(),"Deposit Nowt")]/../../../tbody/tr/td[1]')
  end

  def invoice_tax_and_vat
    find(:xpath, '//td[contains(text(),"Tax&VAT")]/../../../tbody/tr/td[2]')
  end

  def invoice_total_amount
    find(:xpath, '//td[contains(text(),"Total Amount")]/../../../tbody/tr/td[3]')
  end




  
end



