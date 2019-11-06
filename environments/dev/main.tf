
/*
+--------------------------------
| AWS CREDENTIALS
+--------------------------------
*/
provider "aws" {
  shared_credentials_file = "${var.location_aws_credentials}"
  region="${var.region}"
}


/*
+--------------------------------
| NETWORK
+--------------------------------
*/

module "newtwork" {
  source = "./../modules/network"
  project = "${var.project}"
  environment="${var.environment}"
  region="${var.region}"
}