require_relative 'testDrivers/TestDriver'
require_relative 'testDrivers/OCMain'
require_relative 'testDrivers/ViewExternalFile'
require_relative 'testDrivers/RequestRedaction'

$testDrivers = [
                OCMain,
                ViewExternalFile,
                RequestRedaction
                ]
