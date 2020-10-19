require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Linode < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = 'account:read_only'

      option :name, 'linode'

      option :client_options, {
        :site => 'https://login.linode.com',
        :authorize_path => '/oauth/authorize',
        :token_url => '/oauth/token',
      }

      uid { raw_info['uid'] }

      info do
        {
          name:       raw_info['username'],
          email:      raw_info['email'],
          nickname:   raw_info['username']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('https://api.linode.com/v4/profile').parsed
      end

      protected

      def build_access_token
        verifier = request.params["code"]
        params = {:redirect_uri => callback_url, :state => request.params["state"], :client_id => client.id, :client_secret => client.secret}
        client.auth_code.get_token(verifier, params.merge(token_params.to_hash(:symbolize_keys => true)), deep_symbolize(options.auth_token_params))
      end

    end
  end
end
