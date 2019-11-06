
/*
+--------------------------------
| AWS CREDENTIALS
+--------------------------------
*/
provider "aws" {
  shared_credentials_file = "${var.location_aws_credentials}"
}


/*
+--------------------------------
| NETWORK
+--------------------------------
*/

module "newtwork" {
  source = "./../Modules/Network"
  project = "${var.project}"
  eviroment="${var.environment}"
  region="${var.region}"
}