require 'spec_helper'
require 'cfn-model'
require 'cfn-nag/custom_rules/S3BucketPublicReadWriteAclRule'

describe S3BucketPublicReadWriteAclRule do
  context 'S3 Bucket should have access logging configured' do
    it 'returns offending logical resource id' do
      cfn_model = CfnParser.new.parse read_test_template('json/s3_bucket/buckets_with_no_access_loggingin.json')

      actual_logical_resource_ids = S3BucketPublicReadWriteAclRule.new.audit_impl cfn_model
      expected_logical_resource_ids = %w[S3BucketNoAccessLogging]

      expect(actual_logical_resource_ids).to eq expected_logical_resource_ids
    end
  end
end
