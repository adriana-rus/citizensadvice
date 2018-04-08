class HomePage

  include PageObject

  # locators for location popup
  link :england, class: 'home-extent-popup__link', index: 0

  # header locators
  link :logo, css: 'div.main-header__content > a.main-header__logo'
  link :language, css: 'nav.main-header__top-nav > a'
  link :sign_in_icon, css: 'a.hide-offline.main-header__login'
  link :sign_in_link, css: 'a.hide-offline.main-header__login'
  text_field :search_field_header, id: 'main-header__search__input'
  button :search_button_header, css: 'button.main-header__search__submit'

  # search for advice locators
  text_field :search_advice_field, css:'div.search-inline__field > input.searchPlaceholder'
  button :search_advice_button, value: 'Search', index: 0


  def assert_header_elements
    logo?.should == true
    language?.should == true
    sign_in_icon?.should == true
    sign_in_link?.should == true
    search_field_header?.should == true
    search_button_header?.should == true
  end

  def search_for_advice (search_item)
    self.england
    self.search_advice_field = search_item
    self.search_advice_button
  end

end