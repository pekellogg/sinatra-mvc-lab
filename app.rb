require_relative 'config/environment'

class App < Sinatra::Base
    get '/' do
        erb :user_input
    end

    post '/piglatinize' do
        input = params["user_phrase"]
        @piglatinized_input = PigLatinizer.new.piglatinize(input)
        erb :results
    end

end
