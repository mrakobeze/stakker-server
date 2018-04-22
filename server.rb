require 'sinatra/base'

class Server < Sinatra::Base

	def append(file, string)
		IO.write file, [
			(IO.read(file) || ''),
			string
		].join("\n").strip
	end

	before do
		content_type 'text/plain'
	end

	get '/task' do
		'["ping"]'
	end

	get '/ping/:id' do
		append 'pings', params[:id] unless params[:id].strip == 'favicon.ico'
		status 200
	end

	get '/favicon.ico' do
		status 200
	end
end