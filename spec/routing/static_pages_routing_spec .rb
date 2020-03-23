require 'rails_helper'

RSpec.describe Static_pagesController, type: :routing do
  describe 'routing' do

    it 'routes to #home' do
      expect(get: '/home').to route_to('static_pages#home')
    end

    it 'routes to #about' do
      expect(get: '/about').to route_to('static_pages#about')
    end

  end

end