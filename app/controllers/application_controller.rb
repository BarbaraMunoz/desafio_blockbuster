class ApplicationController < ActionController::Base
    include Pagy::Backend
    require 'pagy/extras/bootstrap'
    Pagy::DEFAULT[:items] = 25        # items per page
end
