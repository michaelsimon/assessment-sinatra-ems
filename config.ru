require './config/environment'

use Rack::Static, :urls => ['/css','/fonts','/js','/images'], :root => 'public' # Rack fix allows seeing the static folders.

use Rack::MethodOverride
use ActsController
use ShowsController
use UsersController
use VenuesController
run ApplicationController