class SearchResultsPage

  include PageObject

  unordered_list :results_list, css: 'ul.search-results'
  link :next_page, xpath: '//a[contains(text(),"Next")]'


  #It checks for results on all the links from the page, all the pages.
  def assert_advice_results (advice_result)
    @found = false
    while @found == false
      for @link in 1 .. self.results_list_element.length
        @found = true if @browser.link(css: 'h3 > a', index: @link - 1).text == advice_result
      end
      break if @found == true || self.next_page_element.present? == false
      @browser.send_keys :page_down
      browser.execute_script("window.scrollTo(0, document.body.scrollHeight);")
      self.next_page
      for @link in 1 .. self.results_list_element.length
        @browser.link(css: 'h3 > a', index: @link - 1).text.include? advice_result
      end
    end
  end
end