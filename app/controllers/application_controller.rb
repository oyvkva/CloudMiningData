class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :prepare_meta_tags, if: "request.get?"

def index
end

def prepare_meta_tags(options={})

    site_name        = "Cloud Mining Data"
    description = "Bitcoin mining calculators and detailed miner profitability from cloud mining site Hashnest"
    image       = options[:image] || "your-default-image-url"
    current_url = request.url

    # Let's prepare a nice set of defaults

    defaults = {
      image:       image,
      description: description,
      keywords:    %w[bitcoin, data, bitcoin mining, crypto, alt coins, coins, litecoin, hashnest, bitmain],
      twitter:     {site_name: site_name,
                    site: '@thecookieshq',
                    card: 'summary',
                    description: description,
                    image: image},
      og:          {url: current_url,
                    site_name: site_name,
                    title: site_name,
                    image: image,
                    description: description,
                    type: 'website'}
    }


    options.reverse_merge!(defaults)


    set_meta_tags options

  end

end
