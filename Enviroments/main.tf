
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
  source = "./../Modules/Network"
  var.project = "${var.project}"
  var.eviroment="${var.environment}"
  region="${var.region}"
}