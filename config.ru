require './config/environment'

use Rack::Static, :urls => ['/css','/fonts','/js','/images'], :root => 'public' # Rack fix allows seeing the static folders.

use Rack::MethodOverride
use UsersController
use SessionsController
use ActsController
use ShowsController
use VenuesController
run ApplicationController