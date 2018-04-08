class GooglePage

  include PageObject

  page_url 'https://google.com'

  text_field :google_search_field, id: 'lst-ib'

  def search_for_website (website)
    self.google_search_field = website
    @browser.send_keys :enter
  end

end