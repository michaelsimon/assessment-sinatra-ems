require './config/environment'

use Rack::MethodOverride
use ActsController
use ShowsController
use UsersController
use VenuesController
runApplicationController