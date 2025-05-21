
provider "aws" {
  alias   = "destination"
  profile = "destination"
}

provider "aws" {
  alias   = "source"
  profile = "source"
}

module "app" {
  source = "./multi-provider-module"
  providers = {
    aws.source      = aws.source
    aws.destination = aws.destination
  }
}
