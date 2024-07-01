module "s3" {
  source       = "./modules/s3"
  project_name = var.project_name
  tags         = local.tags
}

module "cloudfront" {
  source  = "./modules/cloudfront"
  s3_id   = module.s3.id
  s3_name = module.s3.name
}