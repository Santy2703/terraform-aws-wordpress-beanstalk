provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region     = var.region_primary
}

provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region     = var.region_cloudfront
    alias      = "for_acm"
}