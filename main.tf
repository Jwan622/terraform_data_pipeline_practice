provider "aws" {
    shared_config_files       = ["/Users/jwan/.aws/config"]
    shared_credentials_files = ["/Users/jwan/.aws/credentials"]
    profile                  = "jwan"
    region                  = "${var.region}"
}

module "s3" {
    source = "./s3_test"
    #bucket name should be unique
    bucket_name = "jwan_test_bucket123"
}
