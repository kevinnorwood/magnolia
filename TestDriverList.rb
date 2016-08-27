require_relative 'testDrivers/TestDriver'
require_relative 'testDrivers/OCMain'
require_relative 'testDrivers/ViewExternalFile'
require_relative 'testDrivers/RequestRedaction'
require_relative 'testDrivers/RequestStatus'
require_relative 'testDrivers/RequestResearch'

$testDrivers = [
                OCMain,
                ViewExternalFile,
                RequestRedaction,
                RequestStatus,
                RequestResearch
                ]
