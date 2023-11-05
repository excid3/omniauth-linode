require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Linode < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = 'account:read_only'

      option :name, 'linode'

      option :client_options, {
        auth_scheme: :request_body,
        site: 'https://login.linode.com',
        authorize_path: '/oauth/authorize',
        token_url: '/oauth/token',
      }

      uid { raw_info['uid'] }

      info do
        {
          name: raw_info['username'],
          email: raw_info['email'],
          nickname: raw_info['username']
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('https://api.linode.com/v4/profile').parsed
      end
    end
  end
end
