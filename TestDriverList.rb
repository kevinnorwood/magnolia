require_relative 'testDrivers/TestDriver'
require_relative 'testDrivers/OCMain'
require_relative 'testDrivers/ViewExternalFile'
require_relative 'testDrivers/RequestStatus'

$testDrivers = [
                OCMain,
                ViewExternalFile,
                RequestStatus
                ]
