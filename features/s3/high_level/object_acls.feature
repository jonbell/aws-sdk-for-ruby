# Copyright 2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You
# may not use this file except in compliance with the License. A copy of
# the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

# language: en
@s3 @high_level @object_acl
Feature: Object ACLs
  As a user of the S3 high-level interface
  I want to be able to manipulate object ACLs
  So that I can control access to my S3 resources

  @set
  Scenario: Set object ACL with a string
    Given my account has an object in it
    When I set the object ACL to a string
    Then the client should have made a "PUT" request to the object ACL
    And the object ACL should resemble the one that was set

  @get
  Scenario: Get the object ACL
    Given I have set an object ACL
    When I ask for the object ACL
    Then the result should be an AccessControlList object
    And the result should have the same grants as the one I set

  @set @roundtrip
  Scenario: Change the object ACL
    Given my account has an object in it
    When I change the object ACL to include a new grant
    Then the client should have made a "PUT" request to the object ACL
    And the object ACL should include the new grant
