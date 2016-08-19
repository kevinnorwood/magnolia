# magnolia

launch through magnolia.rb, magnolia can be optionally launched with two parameters, the exact name of ONE specific test with the key for ONE browser

to add a Test, duplicate test_stub.rb with name of new Test
the new Test must be added to TestList.rb

to add a TestDriver, duplicate test_driver_stub.rb with name of new Test Driver
the new TestDriver must be added to TestDriverList.rb

to add an Action, duplicate action_stub.rb with name of new Action
the new Action must be added to ActionList.rb

a Test can and should be added to at least one Test Driver. simply add the Test to the set_test function.

assumptions can be updated as needed. Beware- assumptions should be global, make sure no other Tests or Actions will be broken by changing an assumption.
